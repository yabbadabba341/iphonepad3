import SwiftUI
import WebKit

/* The desk is the bundled the_forge.html, served from the app's own bundle at
   a fixed app scheme. This is the same construction the established offline
   frameworks use: a stable http-less origin whose storage persists on the
   device, no network, no browser, ever. */

struct DeskView: UIViewRepresentable {

    static let appScheme = "carpe-app"
    static let entryURL = URL(string: "carpe-app://desk/the_forge.html")!

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.setURLSchemeHandler(ShellSchemeHandler(), forURLScheme: DeskView.appScheme)
        config.userContentController.add(context.coordinator, name: "pySaveFile")

        /* the shell surfaces the app already knows to look for:
           window.pywebview.api.save_file(name, mime, b64)  - the Mac/Windows bridge's signature
           window.CarpeNative.saveFile(name, mime, b64)     - the family bridge name
           Both hand the bytes to UIActivityViewController, so Save-a-copy lands in Files. */
        let bridge = """
        (function () {
          var send = function (name, mime, b64) {
            try {
              window.webkit.messageHandlers.pySaveFile.postMessage({ name: name, mime: mime, b64: b64 });
              return true;
            } catch (e) { return false; }
          };
          window.CarpeNative = { saveFile: send };
          window.InkwellNative = window.InkwellNative || { saveFile: send };
          window.pywebview = window.pywebview || {};
          window.pywebview.api = window.pywebview.api || {};
          window.pywebview.api.save_file = send;
        })();
        """
        config.userContentController.addUserScript(
            WKUserScript(source: bridge, injectionTime: .atDocumentStart, forMainFrameOnly: false))

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.isOpaque = false
        webView.allowsBackForwardNavigationGestures = false
        webView.scrollView.contentInsetAdjustmentBehavior = .always
        #if !os(macOS)
        webView.allowsLinkPreview = true
        #endif
        webView.load(URLRequest(url: DeskView.entryURL))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKScriptMessageHandler {
        func userContentController(_ userContentController: WKUserContentController,
                                   didReceive message: WKScriptMessage) {
            guard message.name == "pySaveFile",
                  let body = message.body as? [String: Any],
                  let b64 = body["b64"] as? String,
                  let data = Data(base64Encoded: b64) else { return }
            let name = (body["name"] as? String) ?? "the_forge"
            DispatchQueue.main.async {
                SaveSheet.present(data: data, name: name)
            }
        }
    }
}
