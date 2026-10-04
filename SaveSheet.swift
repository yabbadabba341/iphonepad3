import Foundation
import UIKit

/* writes the bytes to a temporary file and hands it to the system share sheet;
   the reader saves it into Files from there. The one true path for downloads
   out of a web view on iPhone and iPad. */
enum SaveSheet {
    static func present(data: Data, name: String) {
        let safe = name.replacingOccurrences(of: "/", with: "-")
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(safe)
        do { try data.write(to: url, options: .atomic) } catch { return }

        guard let scene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first(where: { $0.activationState == .foregroundActive }) ?? UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let root = scene.windows.first?.rootViewController else { return }

        let sheet = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        sheet.completionWithItemsHandler = { _, _, _, _ in
            try? FileManager.default.removeItem(at: url)
        }
        if let pop = sheet.popoverPresentationController {
            pop.sourceView = root.view
            pop.sourceRect = CGRect(x: root.view.bounds.midX, y: root.view.bounds.midY, width: 0, height: 0)
            pop.permittedArrowDirections = []
        }
        var presenter: UIViewController? = root
        while let next = presenter?.presentedViewController { presenter = next }
        (presenter ?? root).present(sheet, animated: true)
    }
}
