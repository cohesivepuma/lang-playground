//
//  ContentView.swift
//  swiftScratch
//
//  Created by 顾峻祥 on 2026/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("hello")
                .foregroundColor(.orange) //改变颜色
                //.font(.largeTitle)      //改变字号 方式1
                .font(.system(size: 150.0, weight: .bold, design: .default)) //改变字号样式 方式2
                //.bold()                //加粗
                //.fontWeight(.heavy)    //字深
                .italic()
                .strikethrough(color: .red)
                .underline(color: .blue)
                .shadow(color: .pink, radius: 20, x: 10, y: 10)
                .onTapGesture {
                    print("hello has been tapped")
                }

            Label("https://www.baidu.com", systemImage: "book")

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
