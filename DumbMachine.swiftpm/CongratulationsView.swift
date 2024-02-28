//
//  CongratulationsView.swift
//  WWDC24
//
//  Created by Kauane Santana on 24/02/24.
//

import SwiftUI

struct CongratulationsView: View {
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
            HStack{
                VStack {
                    Spacer()
                    Image("bonecoIdle")
                        .resizable()
                        .frame(width: 300, height: 300)
                    
                }
                .padding(0)
                
                VStack {
                    Image("bandeira")
                        .resizable()
                        .frame(width: 750, height: 200)
                    
                    Spacer()
                    
                    VStack(spacing: 50){
                        HStack(spacing: 30){
                            Text("Congratulations!")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("kindergarten", size: 50))
                            Image("apple")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        
                        VStack(spacing: 20){
                            Text("Now you know how an algorithm works.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("And you also know that nobody is born knowing everything.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        HStack(spacing: 30){
                            Text("Not even a machine!")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.custom("kindergarten", size: 35))
                            Image("bonecoInv")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                    }
                    .padding(.leading, 70)
                    
                    
                    
                    Spacer()
                    
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
                    
                    Spacer()
                    
                    
                }
                .frame(width: .infinity, height: .infinity)
            }
            .preferredColorScheme(.light)
            .padding(.horizontal,20)
            .font(.custom("kindergarten", size: 30))
        }
    }
}

#Preview {
    CongratulationsView()
}
