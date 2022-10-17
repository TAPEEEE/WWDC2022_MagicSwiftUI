import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("layout and Interface")) {
                    NavigationLink(destination: CodeBlockStackView()) {
                        FormRowView(icon: "square.stack.3d.up.fill", Name: "What is Stack?", color: Color.blue)
                    }

                    NavigationLink(destination: CodeBlockSpacerPaddingView()) {
                        FormRowView(icon: "ruler.fill", Name: "Spacer and Padding", color: Color.indigo)
                    }
                    
                    NavigationLink(destination: CodeBlockSymbolsView()) {
                        FormRowView(icon: "paintpalette.fill", Name: "SF Symbols Rendering", color: Color.purple)
                    }
                    
                    NavigationLink(destination: CodeBlockScrollViewView()) {
                        FormRowView(icon: "scroll.fill", Name: "ScrollView", color: Color.teal)
                    }
                }
                
                Section(header: Text("Animation and transition")) {
                    NavigationLink(destination: CodeBlockAnimationView()) {
                        FormRowView(icon: "move.3d", Name: "Animation", color: Color.green)
                    }
                }
                                     
                Section(header: Text("Gesture")) {
                    NavigationLink(destination: CodeBlockGestureView()) {
                        FormRowView(icon: "hand.tap.fill", Name: "Gesture", color: Color.orange)
                    }
                }
                
                Section(header: Text("Design System and Components")) {
                    NavigationLink(destination: CodeBlockComponentView()) {
                        FormRowView(icon: "ellipsis.circle.fill", Name: "Components", color: Color.red)
                    }
                }
                
                Section(header: Text("Message from MagicSwift")) {
                    VStack {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(Color("TextColor4"))
                            .font(.system(size: 30))
                            .padding()
                        Text("These are just a few examples, as SwiftUI has a lot more to offer. Try it! then will enjoy it. see ya in WWDC").multilineTextAlignment(.center)
                    }.padding()
                }
            }
            .navigationBarTitle("MagicSwift")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
