//
//  ContentView.swift
//  Example_SwiftUI
//
//  Created by Colin Walsh on 2/17/23.
//

import SwiftUI
import CoverSheet

struct ContentView: View {
    @EnvironmentObject
    var sheetManager: DefaultSheetManager
    
    @State
    var enableBlur: Bool = false
    
    @State
    var backgroundColor: Color = .white
    
    var body: some View {
        CoverSheetView(sheetManager, states: [.collapsed, .normal, .full, .cover]) {
            VStack {
                HStack {
                    Spacer()
                    switch sheetManager.currentState {
                    case .collapsed:
                        Text("Collapsed")
                    case .normal:
                        Text("Normal")
                    case .full:
                        Text("Full")
                    case .cover:
                        Text("Cover")
                    default:
                        EmptyView()
                    }
                    Spacer()
                }.padding(.top, 50)
                Spacer()
            }
            .background(Color.gray)
        } sheet: { height in
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        switch sheetManager.currentState {
                        case .collapsed:
                            Text("Collapsed")
                        case .normal:
                            Text("Normal")
                        case .full:
                            Text("Full")
                        case .cover:
                            Text("Cover")
                        default:
                            EmptyView()
                        }
                        Spacer()
                    }
                }
                .animation(.default, value: sheetManager.currentState)
                .frame(height: height)
            }
            .disabled(true)
        }
        .sheetBackgroundColor(backgroundColor)
        .enableBlurEffect(enableBlur)
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                sheetManager.currentState = .normal
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
