import SwiftUI

@main
struct MyApp: App {
    init() {
        try! UIFont.registerFonts(withExtension: "ttf")
    }
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 17.0, *) {
                ContentView(screenManager: ScreenManager())
            } else {
                Text("aaaaaaa")
            }
        }
    }
}
