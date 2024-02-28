//
//  MenuView.swift
//  WWDC24
//
//  Created by Kauane Santana on 23/02/24.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showMenu: Bool
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            VStack {
                VStack {
                    HStack(spacing: 40){
                        
                        NavigationLink {
                            if #available(iOS 17.0, *) {
                                ContentView(screenManager: ScreenManager())
                            } else {
                                Text("aaaaaaa")
                            }
                        } label: {
                            Image(systemName: "house.fill")
                                .font(.system(size: 30))
                                .frame(width: 100, height: 70)
                                .foregroundColor(.blue)
                        }
                        .transition(.scale)
                        .cornerRadius(7)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 7)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Button {
                            showMenu = false
                        } label: {
                            Text("Resume")
                                .frame(width: 100, height: 70)
                                .foregroundColor(.blue)
                        }
                        .cornerRadius(7)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 7)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                }
                .frame(width: 480, height: 280)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 7)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 500, height: 300)
                .background(.black)
            .cornerRadius(7)
            .font(.custom("kindergarten", size: 25))
            }
        }
    }
}

//#Preview {
//    MenuView(showMenu: .constant(false))
//}
