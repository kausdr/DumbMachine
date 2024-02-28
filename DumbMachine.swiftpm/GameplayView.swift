//
//  GameplayView.swift
//  WWDC24
//
//  Created by Kauane Santana on 19/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct GameplayView: View {
    
    @Binding var posX: CGFloat
    @Binding var posY: CGFloat
    
    @Binding var shape: String
    
    @Binding var posXFixed: CGFloat
    @Binding var posYFixed: CGFloat
    
    @Binding var isColiding: Bool
    @Binding var showApple: Bool
    
    
    @State var dirs = ["UpArrow", "UpArrow"]
    @Binding var coord: [String]
    @Binding var auxCoord: [String]
    
    @Binding var showDialogue: Bool
    @Binding var showTutorialDialogue: Bool
    @Binding var canShowDialogue: Bool
    @Binding var showMenu: Bool
    @Binding var canInteract: Bool
    @Binding var neverShowDialogueAgain: Bool
    
    
    var body: some View {
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        Button {
                            showMenu = true
                        } label: {
                            VStack (spacing: 6){
                                Rectangle()
                                    .fill(.blue)
                                    .frame(width: 40, height: 4)
                                    .cornerRadius(10)
                                
                                Rectangle()
                                    .fill(.blue)
                                    .frame(width: 40, height: 4)
                                    .cornerRadius(10)
                                
                                Rectangle()
                                    .fill(.blue)
                                    .frame(width: 40, height: 4)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.trailing, 40)
                    .padding(.vertical, 0)
                   
                    HStack {
                        Spacer()
                        DrawingView(shape: $shape, posX: $posX, posY: $posY, posXFixed: $posXFixed, posYFixed: $posYFixed, coord: $coord, auxCoord: $auxCoord, isColiding: $isColiding, canInteract: $canInteract, showApple: $showApple, showDialogue: $showDialogue, canShowDialogue: $canShowDialogue, neverShowDialogueAgain: $neverShowDialogueAgain)
                        .onChange(of: auxCoord) { newValue in
                        }
                        
                        Spacer()
                        ZStack{
                            GridView()
                            if showApple{
                                Image("apple")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .offset(x: posXFixed, y: posYFixed)
                            }
                            
                            Image("bonecoIdle")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .offset(x: posX, y: posY)
                        }
                        .onChange(of: coord) { oldValue, newValue in
                            if !coord.isEmpty {
                                withAnimation {
                                    switch coord[0] {
                                    case "UpArrow":
                                        posY -= 90
                                    case "DownArrow":
                                        posY += 90
                                    case "LeftArrow":
                                        posX -= 90
                                    case "RightArrow":
                                        posX += 90
                                    case "Heart":
                                        canInteract = true
                                        print("interagir")
                                    default:
                                        print("nenhum")
                                    }
                                } completion: {
                                    coord.removeFirst()
                                    auxCoord.removeAll()
                                    
                                    
                                }
                            }
                        }
                        Spacer()
                    }
                    HStack{
                        ForEach(auxCoord, id: \.self) { i in
                            Image(i)
                                .resizable()
                                .frame(width: 60, height: 60)
                        }
                        
                    }
                    .frame(alignment: .leading)
                    .offset(x: -300)
                    Spacer()
                }
                .onChange(of: neverShowDialogueAgain) { _ in
                    if neverShowDialogueAgain {
                        posX = -150.0
                        posY = 150.0
                    }
                }
                .navigationBarBackButtonHidden(true)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .preferredColorScheme(.dark)
                .font(.custom("kindergarten", size: 30))
                .overlay {
                    if showDialogue {
                        Spacer()
                        DialogueView(showDialogue: $showDialogue, canShowDialogue: $canShowDialogue, neverShowDialogueAgain: $neverShowDialogueAgain)
                    }
                    
                    if showMenu {
                        MenuView(showMenu: $showMenu)
                    }
                    
                    if showTutorialDialogue {
                        Spacer()
                        TutorialDialogueView(showTutorialDialogue: $showTutorialDialogue)
                    }
                    
                    if !showApple {
                        CongratulationsView()
                    }
                    
                    
                }
                
                
        }
    }
}

//#Preview {
//    GameplayView(posX: .constant(190.0), posY: .constant(30.0), posXFixed: .constant(150.0), posYFixed: .constant(-150), isColiding: .constant(true), coord: .constant([""]))
//}
