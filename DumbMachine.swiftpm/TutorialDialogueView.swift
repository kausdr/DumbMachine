//
//  TutorialDialogueView.swift
//  WWDC24
//
//  Created by Kauane Santana on 24/02/24.
//

import SwiftUI

struct TutorialDialogueView: View {
    
    @Binding var showTutorialDialogue: Bool
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            VStack{
                Spacer()
                
                ZStack{
                    VStack{
                        VStack(spacing: 1){
                            Text("Draw an algorithm to make the Dumb Machine go and pick the apple.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            HStack{
                                Text("Tap")
                                Image("next")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                                Text("to SAVE before RUNNING, or to DRAW MORE.")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            HStack{
                                Text("Tap")
                                Image("run")
                                    .resizable()
                                    .frame(width: 50, height: 40)
                                Text("to RUN the algorithm.")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.leading, 26)
                        
                        
                        
                    }
                    .frame(maxWidth: 700, maxHeight: 180, alignment: .leading)
                    .foregroundColor(.white)
                    .background(.black)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 70)
                    
                    
                    Image("bonecoInv")
                        .resizable()
                        .frame(width: 260, height: 260)
                        .offset(x: 400)
                    
                    
                }
                Text("Tap anywhere to continue")
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .offset(y: -70)
            }
            .frame(width: .infinity, height: .infinity)
            .font(.custom("kindergarten", size: 22))
            
            
        }
        .onTapGesture {
            showTutorialDialogue = false
        }
    }
    
}

#Preview {
    TutorialDialogueView(showTutorialDialogue: .constant(true))
}

