import SwiftUI

/* The app is one window holding the web view that runs the_forge.html. */
@main
struct ShellApp: App {
    var body: some Scene {
        WindowGroup {
            DeskView()
                .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}
