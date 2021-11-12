//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Giovanni Gaffé on 2021/11/10.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            DynamicFilteringView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
