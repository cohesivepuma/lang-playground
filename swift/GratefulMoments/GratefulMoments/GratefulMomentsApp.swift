//
//  GratefulMomentsApp.swift
//  GratefulMoments
//
//  Created by 顾峻祥 on 2026/3/26.
//

import SwiftUI
import SwiftData


@main
struct GratefulMomentsApp: App {
    let dataContainer = DataContainer()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)
    }
}
