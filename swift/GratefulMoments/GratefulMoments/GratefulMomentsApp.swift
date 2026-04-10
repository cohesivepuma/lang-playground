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
    let dataContainer = DataContainer()//app创建时启动SwiftData数据容器


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataContainer)
        }
        .modelContainer(dataContainer.modelContainer)//挂载到model​Container可以全局读取数据
    }
}
