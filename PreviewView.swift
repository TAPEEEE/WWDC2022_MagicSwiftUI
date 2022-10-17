//
//  File.swift
//  SwiftMagic
//
//  Created by Nattapon Suwanno on 20/4/2565 BE.
//

import SwiftUI

// MARK: Stack
struct PreviewStackView: View {
    var ShowStackPreview:String
    @State var show = false
       
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("MainColor"))
            if ShowStackPreview == "VStack" {
                VStack {
                    if show {
                    RoundedRectangle(cornerRadius: 10)
                        .overlay(
                            Text("Item 1").foregroundColor(.white))
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn.delay(0.3))
                    RoundedRectangle(cornerRadius: 10)
                        .overlay(
                            Text("Item 2").foregroundColor(.white))
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn.delay(0.2))
                    RoundedRectangle(cornerRadius: 10)
                        .overlay(
                            Text("Item 3").foregroundColor(.white))
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn.delay(0.1))
                    }
                }.padding()
                    .foregroundColor(Color("TextColor1"))
                
                    .onDisappear() {
                        show.toggle()
                    }
                    .onAppear() {
                        show.toggle()
                    }
            }
                    
            else if ShowStackPreview == "HStack" {
                HStack {
                    if show {
                        RoundedRectangle(cornerRadius: 10)
                            .overlay(
                                Text("Item 1").foregroundColor(.white))
                            .transition(.move(edge: .trailing))
                            .animation(.easeIn.delay(0.1))
                        RoundedRectangle(cornerRadius: 10)
                            .overlay(
                                Text("Item 2").foregroundColor(.white))
                            .transition(.move(edge: .trailing))
                            .animation(.easeIn.delay(0.2))
                        RoundedRectangle(cornerRadius: 10)
                            .overlay(
                                Text("Item 3").foregroundColor(.white))
                            .transition(.move(edge: .trailing))
                            .animation(.easeIn.delay(0.3))
                    }
                }.padding()
                    .foregroundColor(Color("TextColor1"))
                
                    .onDisappear() {
                        show.toggle()
                    }
                    .onAppear() {
                        show.toggle()
                    }
            }
                
            else if ShowStackPreview == "ZStack" {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("TextColor1"))
                        Circle()
                            .shadow(radius: 5)
                            .foregroundColor(Color("TextColor2"))
                            .padding(30)
                        Text("Circle is top layer").foregroundColor(Color("Text"))
                    }
                }.padding()
            }
            
            else {
                Text("**No Preview**\nDrag and drop the item into the box to try.").multilineTextAlignment(.center)
            }
        }
    }
}

// MARK: Spacer Padding
struct PreviewSpacerPaddingView: View {
    
    var ShowSpacerPaddingPreview:String
    @State var show = false
       
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("MainColor"))
            if ShowSpacerPaddingPreview == ".padding()" {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.gray)
                        Image(systemName: "applelogo")
                            .font(.system(size: 45))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding()
                    .border(Color.blue)
                    
                    Text("Adds an equal padding amount to specific edges of this view.")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
                    
            else if ShowSpacerPaddingPreview == "Spacer()" {
                VStack {
                    HStack {
                        if show {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(Color.gray)
                                Image(systemName: "applelogo")
                                    .font(.system(size: 45))
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: 70, height: 70, alignment: .center)
                            .padding(20)
                        }
                        
                        Spacer()
                        
                        Text("**<-- Spacer() -->**").foregroundColor(Color.red)
                            .padding()
                        
                        Spacer()
                    }
                    .transition(.move(edge: .trailing))
                    .animation(.easeIn.delay(0.3))
                    .border(Color.blue)
                    
                    Text("**Spacer()**  used  to “push” align views horizontally or vertically. (In the example it will be **HStack.**)")
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .onDisappear() {
                    show.toggle()
                }
                .onAppear() {
                    show.toggle()
                }
            }
            
            else {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.gray)
                        Image(systemName: "applelogo")
                            .font(.system(size: 45))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding()
                    Text("Drag and drop the item into the box to try.").multilineTextAlignment(.center)
                        .padding()
                }
            }
        }
    }
}

struct PreviewAnimationView: View {
    
    var ShowAnimationView:String
    @State var show = true
    @State private var duration: Double = 0.8
       
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("MainColor"))
            if ShowAnimationView == ".easeIn" {
                VStack {
                    AnimationBoxView(animation: Animation.easeIn(duration: duration), move: show)
                        .padding()
                    
                    Text("**easeIn(duration: \(String(format:"%.1f", duration)))**")
                        .multilineTextAlignment(.center)
                    
                    Slider(value: $duration, in: 0.5 ... 2)
                        .tint(Color("TextColor1"))
                        .padding(.horizontal)
                    
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .foregroundColor(Color("TextColor4"))
                    }
                    .padding()
                }
            }
                    
            else if ShowAnimationView == ".easeInOut" {
                VStack {
                    AnimationBoxView(animation: Animation.easeInOut(duration: duration), move: show)
                        .padding()
                    
                    Text("**easeInOut(duration: \(String(format:"%.1f", duration)))**")
                        .multilineTextAlignment(.center)
                    
                    Slider(value: $duration, in: 0.5 ... 2)
                        .tint(Color("TextColor1"))
                        .padding(.horizontal)
                    
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .foregroundColor(Color("TextColor4"))
                    }
                    .padding()
                }
            }
            
            else if ShowAnimationView == ".easeOut" {
                VStack {
                    AnimationBoxView(animation: Animation.easeOut(duration: duration), move: show)
                        .padding()
                    
                    Text("**easeOut(duration: \(String(format:"%.1f", duration)))**")
                        .multilineTextAlignment(.center)
                    
                    Slider(value: $duration, in: 0.5 ... 2)
                        .tint(Color("TextColor1"))
                        .padding(.horizontal)
                    
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .foregroundColor(Color("TextColor4"))
                    }
                    .padding()
                }
            }
            
            else if ShowAnimationView == ".linear" {
                VStack {
                    AnimationBoxView(animation: Animation.linear(duration: duration), move: show)
                        .padding()
                    
                    Text("**linear(duration: \(String(format:"%.1f", duration)))**")
                        .multilineTextAlignment(.center)
                    
                    Slider(value: $duration, in: 0.5 ... 2)
                        .tint(Color("TextColor1"))
                        .padding(.horizontal)
                    
                    Button {
                        show.toggle()
                    } label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(maxWidth: 25, maxHeight: 25)
                            .foregroundColor(Color("TextColor4"))
                    }
                    .padding()
                }
            }
            
            else {
                VStack {
                    AnimationBoxView(animation: Animation.easeIn(duration: 0.8), move: show)
                        .padding()
                    
                    Text("Drag and drop the item into the box and press the button to try.")
                        .multilineTextAlignment(.center)
                        .padding()
                    
                }
            }
        }
    }
}

struct AnimationBoxView: View {
    private static let ShapeW = CGFloat(30)
    private static let MoveSize = CGFloat(20)
    let animation: Animation
    var move: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Image(systemName: "swift")
                        .frame(maxWidth: 30,
                               maxHeight: 30)
                        .font(Font.largeTitle)
                        .foregroundColor(Color("TextColor4"))
                        .offset(x: move ? 0 :
                                    geometry.size.width -
                                    AnimationBoxView.ShapeW -
                                    2*AnimationBoxView.MoveSize)
                        .animation(animation, value: move)
                        .padding(AnimationBoxView.MoveSize)
                    Spacer()
                }
                .frame(maxWidth: geometry.size.width,
                       maxHeight: geometry.size.height)
            }
            .border(Color("TextColor2"), width: 3)
            .frame(maxWidth: .infinity)
        }
    }
}

struct PreviewSymbolsView: View {
    var Symbols: [String] = ["ivfluid.bag","lungs.fill","bolt.car.fill","testtube.2"]
    var ShowSymbolsPreview:String
       
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("MainColor"))
            if ShowSymbolsPreview == ".monochrome" {
                VStack {
                    HStack {
                        ForEach(self.Symbols, id: \.self, content: { Symbols in
                            Image(systemName:Symbols)
                                .font(.system(size: 45))
                                .symbolRenderingMode(.monochrome)
                        })
                    }
                    .padding()
                    
                    Text("**Monochrome** - Applies one color to all symbols")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            } else if ShowSymbolsPreview == ".hierarchical" {
                VStack {
                    HStack {
                        ForEach(self.Symbols, id: \.self, content: { Symbols in
                            Image(systemName:Symbols)
                                .font(.system(size: 45))
                                .symbolRenderingMode(.hierarchical)
                        })
                    }
                    .padding()
                    
                    Text("**Hierarchical** — Applies one color to all symbols, varying the color’s opacity according to each layer’s hierarchical level.")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            } else if ShowSymbolsPreview == ".palette" {
                VStack {
                    HStack {
                        ForEach(self.Symbols, id: \.self, content: { Symbols in
                            Image(systemName:Symbols)
                                .font(.system(size: 45))
                                .symbolRenderingMode(.palette)
                        })
                    }
                    .padding()
                    
                    Text("**Palette** — Applies two or more contrasting colors to each symbol, using one color per layer. ")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            } else if ShowSymbolsPreview == ".multicolor" {
                VStack {
                    HStack {
                        ForEach(self.Symbols, id: \.self, content: { Symbols in
                            Image(systemName:Symbols)
                                .font(.system(size: 45))
                                .symbolRenderingMode(.multicolor)
                        })
                    }
                    .padding()
                    
                    Text("**Multicolor** — Applies system-defined intrinsic colors to some symbols to enhance meaning. ")
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            
            else {
                VStack {
                    Text("**No Preview**\nDrag and drop the item into the box to try.").multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct PreviewScrollView: View {
    var ShowScrollViewPreview:String
       
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("MainColor"))
            if ShowScrollViewPreview == ".vertical" {
                HStack {
                    ScrollView {
                        VStack {
                            ForEach(0..<10) {
                                Text("Item \($0)")
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)
                                    .background(Color("TextColor1"))
                            }
                        }
                    }
                    .padding()
                    
                    VStack {
                        Text("**ScrollView** - allows us to create scrolling containers of views relatively easily in example is **vertical**").multilineTextAlignment(.leading)
                            .padding()
                    }
                }
            }
                    
            else if ShowScrollViewPreview == ".horizontal" {
                VStack {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) {
                                Text("Item \($0)")
                                    .foregroundColor(.white)
                                    .frame(width: 90, height: 90)
                                    .background(Color("TextColor1"))
                            }
                        }
                    }
                    .padding()

                    Text("**ScrollView** - allows us to create scrolling containers of views relatively easily in example is **horizontal**").multilineTextAlignment(.center)
                        .padding()
                }
            }
            
            else {
                Text("**No Preview**\nDrag and drop the item into the box to try.").multilineTextAlignment(.center)
            }
        }
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

struct PreviewGesture: View {
    var ShowGesturePreview:String
    @State var offset: CGSize = .zero
    @GestureState var long = false
    @State var show = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("MainColor"))
            if ShowGesturePreview == "TapGesture()" {
                let tapGesture = TapGesture()
                    .onEnded { _ in
                        self.show.toggle()
                }
                
                Circle()
                    .fill(Color.random())
                    .frame(width: 200, height: 200)
                    .gesture(tapGesture)
                    .scaleEffect(show ? 1.2 : 1)
                    .animation(.easeIn(duration: 0.1))
                    .overlay(
                        Text("Tap to try")
                    )
            }
                    
            else if ShowGesturePreview == "LongPressGesture()" {
                let longPressGesture = LongPressGesture()
                    .updating($long) { value, state, transcation in
                        state = value
                    }
                    .onEnded { (value) in
                    }
                
                Circle()
                    .fill(Color.random())
                    .frame(width: 200, height: 200)
                    .gesture(longPressGesture)
                    .overlay(
                        Text("Tap to try")
                    )
                    .scaleEffect(long ? 1.2 : 1)
                    .animation(.easeIn(duration: 1))
            }
            
            else if ShowGesturePreview == "DragGesture()" {
                let dragGesture = DragGesture()
                    .onChanged { (value) in
                        self.offset = value.translation
                    }
                    .onEnded { (value) in
                        if (abs(value.translation.width) >= 40 || abs(value.translation.height - (-260)) >= 40){
                            self.offset = .zero
                        }
                        else {
                            self.offset = CGSize(width: 0, height: -260)
                        }
                    }
                
                Circle()
                    .fill(Color.random())
                    .frame(width: 200, height: 200)
                    .offset(offset)
                    .overlay(
                        Text("Drag me!!!")
                    )
                    .gesture(dragGesture)
                    .animation(.spring())
            }
            
            else {
                Text("**No Preview**\nDrag and drop the item into the box to try.").multilineTextAlignment(.center)
            }
        }
    }
}

struct PreviewComponent: View {
    var ShowComponentPreview:String
    @State private var showingAlert = false
    @State private var SwControl = true
    @State private var SdControl: Double = 1
    @State private var SmControl = 0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("MainColor"))
            if ShowComponentPreview == "Button" {
                VStack {
                    Button(action: {
                        self.showingAlert = true
                    }) {
                        Text("Alert Button")
                            .foregroundColor(Color("TextColor4"))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color("TextColor2")))
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Title"),
                            message: Text("Message"),
                            primaryButton: .default(Text("Confirm")),
                            secondaryButton: .cancel()
                        )
                    }
                    Text("Example of alert button When you press the button, an alert window will appear.").multilineTextAlignment(.center)
                        .padding()
                }
            }
            else if ShowComponentPreview == "Control" {
                VStack {
                    Toggle("Toggle Switch", isOn: $SwControl)
                        .padding()
                        .padding(.vertical)
                    
                    Text("Slider")
                    Slider(value: $SdControl, in: 0 ... 10)
                        .tint(Color("TextColor1"))
                        .padding(.horizontal)
                        .padding(.vertical)
                    
                    Text("Picker")
                    Picker("What is your favorite color?", selection: $SmControl) {
                            Text("1").tag(0)
                            Text("2").tag(1)
                            Text("3").tag(2)
                    }.pickerStyle(.segmented)
                        .padding(.horizontal)
                        .padding(.vertical)
                }
            }
            else {
                Text("**No Preview**\nDrag and drop the item into the box to try.").multilineTextAlignment(.center)
            }
        }
    }
}
