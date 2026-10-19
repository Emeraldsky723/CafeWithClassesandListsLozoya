//
//  CafeWithClassesandListsLozoyaApp.swift
//  CafeWithClassesandListsLozoya
//
//  Created by SCOTT LOZOYA on 10/1/26.
//

import SwiftUI
import SwiftData
@main
struct CafeWithClassesandListsLozoyaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ItemStruct.self)
        }
    }
}
