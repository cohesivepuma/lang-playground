//
//  Moment.swift
//  GratefulMoments
//
//  Created by 顾峻祥 on 2026/4/1.
//
import Foundation //提供最基础的数据支持，Data、String、Date都靠它
import SwiftData //负责把写的东西存到手机硬盘里面
import UIKit //老牌框架，有些底层技术还是要用到它


@Model //SwiftData相关
class Moment {
    var title: String
    var note: String
    var imageData: Data?
    var timestamp: Date
    
    init(title: String, note: String, imageData: Data? = nil, timestamp: Date = .now) {
        self.title = title
        self.note = note
        self.imageData = imageData
        self.timestamp = timestamp
    }
    
    var image: UIImage? {
            imageData.flatMap { //flatMap是一个监测器，如果imageData是nil会直接返回，如果imageData有值会取出值并处理
                UIImage(data: $0) //$0就是取出来的这个值
            }
        }
}

extension Moment { //extension把真正的开发数据和假代码分开来放
    static let sample = sampleData[0]
    static let longTextSample = sampleData[1]
    static let imageSample = sampleData[4]


    static let sampleData = [
        Moment(
            title: "🍅🥳",
            note: "Picked my first homegrown tomato!"
        ),
        Moment(
            title: "Passed the test!",
            note: "The chem exam was tough, but I think I did well 🙌 I’m so glad I reached out to Guillermo and Lee for a study session. It really helped!",
            imageData: UIImage(named: "Study")?.pngData()//图片转化为二进制数据流存进去，？是可选的意思，防止程序运行过程中因缺失图片而导致的直接闪退
        ),
        Moment(
            title: "Down time",
            note: "So grateful for a relaxing evening after a busy week.",
            imageData: UIImage(named: "Relax")?.pngData()
        ),
        Moment(
            title: "Family ❤️",
            note: ""
        ),
        Moment(
            title: "Rock on!",
            note: "Went to a great concert with Blair 🎶",
            imageData: UIImage(named: "Concert")?.pngData()
        )
    ]
}
