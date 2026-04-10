//
//  DataContainer.swift
//  GratefulMoments
//
//  Created by 顾峻祥 on 2026/4/1.
// 这里主要是数据层，用 Swift​Data 管理 Moment 的存储（Model​Container + Model​Context）。
//以及提供 sample​Data​Container() 方便预览时加载示例数据。
import SwiftData
import SwiftUI

@Observable //仓库内容变了，UI会自动收到通知并刷新
@MainActor //强制“仓库管家”在主线程上工作
class DataContainer {
    let modelContainer: ModelContainer //负责物理储存，知道手机存放数据的物理仓库在哪，也知道你的schema（数据结构）长什么样


    var context: ModelContext { //增删查改都是在ModelContext上面进行的
        modelContainer.mainContext
    }


    init(includeSampleMoments: Bool = false) { //这个仓库只能放Moment这种东西
            let schema = Schema([
                Moment.self,
            ])


            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleMoments)//选地址，isStoredInMemoryOnly是true就存入手机硬盘，isStoredInMemoryOnly是false就存入内存，app关闭即丢失


            do {
                modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])


                if includeSampleMoments { //做测试用的
                    loadSampleMoments()
                }
                try context.save()
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }


        private func loadSampleMoments() {
            for moment in Moment.sampleData {
                context.insert(moment)
            }
        }
    }


    private let sampleContainer = DataContainer(includeSampleMoments: true)


    extension View {
        func sampleDataContainer() -> some View {
            self
                .environment(sampleContainer) //将管家塞进环境
                .modelContainer(sampleContainer.modelContainer)//将仓库塞进环境
        }
    }
