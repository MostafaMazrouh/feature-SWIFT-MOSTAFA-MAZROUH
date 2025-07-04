//
//  OutingsApp.swift
//  Outings
//
//  Created by Mostafa Mazrouh on 2025-06-07.
//

import SwiftUI
import SwiftData

@main
struct OutingsApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Shop.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            // Dependency injection with default values
            MainView(viewModel: ShopVM(repo: ShopRepo()))
        }
        .modelContainer(sharedModelContainer)
    }
}
