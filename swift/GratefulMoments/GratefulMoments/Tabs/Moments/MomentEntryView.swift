//
//  MomentEntryView.swift
//  GratefulMoments
//
//  Created by 顾峻祥 on 2026/4/1.
//

import SwiftUI
import PhotosUI //导入相册库，处理相册的相关内容
import SwiftData

struct MomentEntryView: View {
    @State private var title = "" //state是一个状态变量，声明的值改变了会重新渲染整个界面
    @State private var note = ""
    @State private var imageData: Data?//真正的图片：图片的二进制文件
    @State private var newImage: PhotosPickerItem?//存的是用户选择了哪一张图，？表示是可选类型，因为刚开始图片还没有传进来
    @State private var isShowingCancelConfirmation = false
    
    @Environment(\.dismiss) private var dismiss //系统内置指令，调用时该页面会直接消失
    @Environment(DataContainer.self) private var dataContainer //把DataContainer中类似“管家”的身份搬过来了
    
    
    
    var body: some View { //some View是一种返回类型以及一种规定的协议，在此框架下要按照它的要求来写
        NavigationStack {
            ScrollView {//内容不足的时候允许滚动查看
                contentStack
            }
            .scrollDismissesKeyboard(.interactively)//用户可以向下把键盘推回去,但是为什么会在NavigationStack里面加上？
            .navigationTitle("Grateful For")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") {
                        if title.isEmpty, note.isEmpty, imageData == nil {
                            dismiss()
                        } else {
                            isShowingCancelConfirmation = true
                        }
                    }
                    .confirmationDialog("Discard Moment", isPresented: $isShowingCancelConfirmation) {
                        Button("Discard Moment", role: .destructive) {
                            dismiss()
                        }
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add", systemImage: "checkmark") {
                        let newMoment = Moment( //创建一个新的moment对象
                            title: title,
                            note: note,
                            imageData: imageData,
                            timestamp: .now
                        )
                        dataContainer.context.insert(newMoment) //叫dataContainer来保存这些数据
                        do {
                            try dataContainer.context.save() //保存成功就好
                            dismiss()
                        } catch { //如果出现问题就报错
                            // Don't dismiss
                        }
                    }
                    .disabled(title.isEmpty)//如果标题是空的那就写不了，强制一定要有一个标题
                }
            }
        }
    }
    
    private var photoPicker: some View {
        PhotosPicker(selection: $newImage) {
            Group {
                if let imageData, let uiImage = UIImage(data: imageData) {
                    //if let是可选绑定，
                    Image(uiImage: uiImage)
                        .resizable()//默认屏幕有多大图片就多大，加上这个才会在你设定的框架中显示
                        .scaledToFit()//保持原来的图片比例
                } else {
                    Image(systemName: "photo.badge.plus.fill")
                        .font(.largeTitle)
                        .frame(height: 250)//固定高度
                        .frame(maxWidth: .infinity)//撑满屏幕
                        .background(Color(white: 0.4, opacity: 0.32))//灰色背景，0.32透明度
                }
            }
            //                        .frame(height: 250)//固定高度
            //                        .frame(maxWidth: .infinity)//撑满屏幕
            //                        .background(Color(white: 0.4, opacity: 0.32))//灰色背景，0.32透明度
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .onChange(of: newImage) { //监测你选择了哪一张图片，只要选择了就触发
            guard let newImage else { return } //确保选择了图片而不是取消了图片
            Task { //开启一个后台任务
                imageData = try await newImage.loadTransferable(type: Data.self) //尝试把选中的图片转化为二进制文件
            }
        }
    } //这是一个定义，不直接显示
    
    
    var contentStack: some View {
        VStack(alignment: .leading) {
            TextField(text: $title) {
                Text("Title (Required)")
            }
            .font(.title.bold())
            .padding(.top, 48)
            Divider()
            
            TextField("Log your small wins", text: $note, axis: .vertical)//axis: .vertical使得可以向下换行而不是细长一条
                .multilineTextAlignment(.leading)//左对齐
                .lineLimit(5...Int.max)//默认是5行高度，但是会随着你行数变多而变化，也就是Int.max的作用
            
            photoPicker
        }
        .padding()//默认上下左右是16px，为了美观自动补的吧
    }
}

#Preview {
    MomentEntryView()
        .sampleDataContainer()
}
