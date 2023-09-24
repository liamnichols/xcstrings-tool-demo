import DogKit
import SwiftData
import SwiftUI

@main
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Dog.self)
    }
}
