//
//  GestureView.swift
//  SwiftMagic
//
//  Created by Nattapon Suwanno on 22/4/2565 BE.
//

import SwiftUI

struct GestureView: View {
    @State var backgroundColor: Color = Color(UIColor.systemGray5)
    @State var StrokeBox: Color = .gray
    @State var TextBox: String = ""

    var CodeText: [String] = ["TapGesture()", "LongPressGesture()","DragGesture()"]

    var body: some View {
        VStack {
            PreviewGesture(ShowGesturePreview: TextBox)
                .frame(minWidth: 100, idealWidth: .infinity, maxWidth: 150, minHeight: 100, idealHeight: 120, maxHeight: 350, alignment: .center)
                .padding()
            
            VStack {
                HStack {
                    Group {
                        Text("let ").foregroundColor(Color("TextColor1")) +
                        Text("Gesture ").foregroundColor(Color("TextColor2")) +
                        Text("=")
                    }
                RoundedRectangle(cornerRadius: 10).strokeBorder(StrokeBox,lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(backgroundColor))
                    .overlay(
                        Text(TextBox).padding())
                    .frame(width: 160, height: 50)
                    .onDrop(of: ["public.text"], delegate: GestureDropDelegate(color: $backgroundColor, StrokeColor: $StrokeBox, Text: $TextBox))
                    .foregroundColor(Color("TextColor3"))
                }
            }.font(Font.headline.weight(.bold))
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("MainColor")))
        }
        
        Text("**Drag and drop the item into the box.**")
            .padding([.top], 20)
        
        ScrollView(.horizontal) {
            HStack {
                ForEach(self.CodeText, id: \.self, content: { TextCode in
                    Text(TextCode)
                        .foregroundColor(Color("TextColor3"))
                        .font(Font.headline.weight(.bold))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 160, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemGray5)))
                        .onDrag { NSItemProvider(object: TextCode as NSString) }
                })
            }.padding()
        }
    
    }
}

struct GestureDropDelegate: DropDelegate {
    @Binding var color: Color
    @Binding var StrokeColor: Color
    @Binding var Text: String

    func performDrop(info: DropInfo) -> Bool {
        if let item = info.itemProviders(for: ["public.text"]).first {
            item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
                if let data = text as? Data {
                    let inputStr = String(decoding: data, as: UTF8.self)
                    if inputStr == "TapGesture()" {
                        self.color = Color(UIColor.systemGray5)
                        self.Text = "TapGesture()"
                        self.StrokeColor = .green
                    } else if inputStr == "LongPressGesture()" {
                        self.color = Color(UIColor.systemGray5)
                        self.Text = "LongPressGesture()"
                        self.StrokeColor = .green
                    } else if inputStr == "DragGesture()" {
                        self.color = Color(UIColor.systemGray5)
                        self.Text = "DragGesture()"
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

