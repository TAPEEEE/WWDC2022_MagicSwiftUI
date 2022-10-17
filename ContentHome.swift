//
//  File.swift
//  SwiftMagic
//
//  Created by Nattapon Suwanno on 20/4/2565 BE.
//

import SwiftUI

struct CodeBlockStackView: View {
    var body: some View {
        VStack(spacing: 20) {
            StackView()
        }.navigationBarTitle("What is Stack?", displayMode: .large)
            .background(Color(UIColor.systemGray6))
    }
}

struct CodeBlockSpacerPaddingView: View {
    var body: some View {
        VStack(spacing: 20) {
            SpacerPaddingView()
        }.navigationBarTitle("Spacer and Padding", displayMode: .large)
            .background(Color(UIColor.systemGray6))
    }
}

struct CodeBlockSymbolsView: View {
    var body: some View {
        VStack(spacing: 20) {
            SymbolsView()
        }.navigationBarTitle("Symbols Rendering", displayMode: .large)
            .background(Color(UIColor.systemGray6))
    }
}

struct CodeBlockAnimationView: View {
    var body: some View {
        VStack(spacing: 20) {
            AnimationView()
        }.navigationBarTitle("Animation", displayMode: .large)
            .background(Color(UIColor.systemGray6))
    }
}

struct CodeBlockGestureView: View {
    var body: some View {
        VStack(spacing: 20) {
            GestureView()
        }.navigationBarTitle("Gesture", displayMode: .large)
            .background(Color(UIColor.systemGray6))
    }
}

struct CodeBlockScrollViewView: View {
    var body: some View {
        VStack(spacing: 20) {
            ScrollViewView()
        }.navigationBarTitle("Image Style", displayMode: .large)
            .background(Color(UIColor.systemGray6))
    }
}

struct CodeBlockComponentView: View {
    var body: some View {
        VStack(spacing: 20) {
            ComponentView()
        }.navigationBarTitle("Components", displayMode: .large)
            .background(Color(UIColor.systemGray6))
    }
}
