//
//  CoreDataPlaygroundApp.swift
//  CoreDataPlayground
//
//  Created by Augusto Monteiro on 06/04/22.
//

import SwiftUI

@main
struct CoreDataPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.container.viewContext
            ListView(viewModel: .init(context: viewContext))
        }
    }
}
