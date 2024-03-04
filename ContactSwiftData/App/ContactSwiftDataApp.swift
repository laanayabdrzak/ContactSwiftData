//
//  ContactSwiftDataApp.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI
import SwiftData

@main
struct ContactSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Contact.self)
    }
}
