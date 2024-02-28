//
//  DialogueView.swift
//  WWDC24
//
//  Created by Kauane Santana on 23/02/24.
//

import SwiftUI

struct DialogueView: View {
    
    @Binding var showDialogue: Bool
    @Binding var canShowDialogue: Bool
    @Binding var neverShowDialogueAgain: Bool
    
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
                        VStack{
                            Text("Remember that the computer doesn't know what to do next, you have to tell him the step by step before running.")
                                .frame(maxWidth: 600, alignment: .leading)
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
            .font(.custom("kindergarten", size: 25))
            
            
        }
        .onTapGesture {
            canShowDialogue = false
            showDialogue = false
            neverShowDialogueAgain = true
        }
    }
    
}

#Preview {
    DialogueView(showDialogue: .constant(true), canShowDialogue: .constant(true), neverShowDialogueAgain: .constant(false))
}
