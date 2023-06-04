//
//  MaintenanceLogApp.swift
//  MaintenanceLog
//
//  Created by Kakeru Fukuda on 2023/05/30.
//

import SwiftUI

@main
struct Main: App {
    init() {
        registerContainer()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
    
    private func registerContainer() {
        container.register(IStorage.self, .default) {
            UserDefaultsStorage(.standard, bundleIdentifier: Bundle.main.bundleIdentifier!)
        }
    }
}
