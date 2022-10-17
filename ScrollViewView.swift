//
//  ScrollViewView.swift
//  SwiftMagic
//
//  Created by Nattapon Suwanno on 24/4/2565 BE.
//

import SwiftUI

struct ScrollViewView: View {
    @State var backgroundColor: Color = Color(UIColor.systemGray5)
    @State var StrokeBox: Color = .gray
    @State var TextBox: String = ""

    
    var CodeText: [String] = [".vertical", ".horizontal"]

    var body: some View {
        VStack {
            PreviewScrollView(ShowScrollViewPreview: TextBox)
                .frame(minWidth: 100, idealWidth: .infinity, maxWidth: 150, minHeight: 100, idealHeight: 120, maxHeight: 350, alignment: .center)
                .padding()
            
            
            VStack {
                HStack {
                    Group {
                        Text("ScrollView ").foregroundColor(Color("TextColor3")) +
                        Text("(")
                    }
                    RoundedRectangle(cornerRadius: 10).strokeBorder(StrokeBox,lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor))
                        .overlay(
                            Text(TextBox))
                        .frame(width: 120, height: 50)
                        .onDrop(of: ["public.text"], delegate: ScrollViewDropDelegate(color: $backgroundColor, StrokeColor: $StrokeBox, Text: $TextBox))
                        .foregroundColor(Color("TextColor3"))
                    Text(") {")
                }
                Group {
                    Text("Item 1...10 ").foregroundColor(Color("TextColor4")) +
                    Text("}")
                }
            }.font(Font.headline.weight(.bold))
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("MainColor")))
        }
        
        Text("**Drag and drop the item into the box.**")
            .padding([.top], 20)
        HStack {
            ForEach(self.CodeText, id: \.self, content: { TextCode in
                Text(TextCode)
                    .foregroundColor(Color("TextColor3"))
                    .font(Font.headline.weight(.bold))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 120, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray5)))
                    .onDrag { NSItemProvider(object: TextCode as NSString) }
            })
        }.padding()
        Spacer()
    }
}

struct ScrollViewDropDelegate: DropDelegate {
    @Binding var color: Color
    @Binding var StrokeColor: Color
    @Binding var Text: String

    func performDrop(info: DropInfo) -> Bool {
        if let item = info.itemProviders(for: ["public.text"]).first {
            item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
                if let data = text as? Data {
                    let inputStr = String(decoding: data, as: UTF8.self)
                    if inputStr == ".vertical" {
                        self.color = Color(UIColor.systemGray5)
                        self.Text = ".vertical"
                        self.StrokeColor = .green
                    } else if inputStr == ".horizontal" {
                        self.color = Color(UIColor.systemGray5)
                        self.Text = ".horizontal"
                        self.StrokeColor = .green
                    }
                }
            }
        } else {
            return false
        }
        return true
    }
}

