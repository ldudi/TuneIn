//
//  TuneInApp.swift
//  TuneIn
//
//  Created by Labhesh Dudi on 11/05/26.
//

import SwiftUI
import SwiftData
import SwiftfulRouting

@main
struct TuneInApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}


// Source - https://stackoverflow.com/a/60067869
// Posted by Nick Bellucci
// Retrieved 2026-05-16, License - CC BY-SA 4.0

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
