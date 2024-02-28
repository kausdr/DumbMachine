//
//  DrawingView.swift
//  WWDC24
//
//  Created by Kauane Santana on 06/02/24.
//

import SwiftUI
import Combine

struct Line {
    var points = [CGPoint]()
    var color: Color = .blue
    var lineWidth: Double = 12.0
    
}

struct DrawingView: View {
    
    @State private var currentLine = Line()
    @State private var lines: [Line] = []
    
    @Binding var shape: String
    @State var goBack = false
    
    @Binding var posX: CGFloat
    @Binding var posY: CGFloat
    
    @Binding var posXFixed: CGFloat
    @Binding var posYFixed: CGFloat
    
    
    @Binding var coord: [String]
    @Binding var auxCoord: [String]
    
    @Binding var isColiding: Bool
    @Binding var canInteract: Bool
    @Binding var showApple: Bool
    
    @Binding var showDialogue: Bool
    @Binding var canShowDialogue: Bool
    
    @Binding var neverShowDialogueAgain: Bool
    
    
    
    
    let classifier = FormsClassifier()
    
    @State var iteration = 0
    
    var body: some View {
        
        VStack (spacing: 40){
            HStack(spacing: 70){
                Button {
                    print("------")
                    
                    coord = auxCoord
                    canShowDialogue = true
                    
                    
                } label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 30))
                        .frame(width: 60, height: 50)
                        .foregroundColor(.blue)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 7)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                
                Button {
                    guard let canvaDrawing = ImageRenderer(content: canvaView).uiImage else {
                        
                        return
                    }
                    
                    //teste
                    print("renderizou")
                    print(canvaDrawing.size)
                    
                    guard let render = canvaDrawing.convert() else {
                        
                        return
                    }
                    
                    //teste
                    print("converteu 2")
                    print(CVPixelBufferGetWidth(render), CVPixelBufferGetHeight(render))
                    
                    do {
                        let output = try classifier.prediction(image: render)
                        
                        shape = output.target
                        print(shape)
                        auxCoord.append(output.target)
                        
                    }
                    catch {
                        print(error)
                    }
                    
                    lines.removeAll()
                    
                    
                } label: {
                    Image(systemName: "applepencil.and.scribble")
                        .font(.system(size: 30))
                        .frame(width: 60, height: 50)
                        .foregroundColor(.blue)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 7)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                
            }
            .onChange(of: posX) { _ in
                checkCollision()
            }
            .onChange(of: posY) { _ in
                checkCollision()
            }
            .onChange(of: canInteract) { _ in
                print("can interact mudou")
                if canInteract {
                    if isColiding {
                        showApple = false
                    }
                }
            }
            .onReceive(Just(canInteract).merge(with: Just(isColiding))) { _ in
                if !canInteract || !isColiding {
                    if canShowDialogue && !neverShowDialogueAgain{
                        showDialogue = true
                    }
                    
                    
                    
                }
            }
            
            
            HStack(spacing: 30){
                VStack{
                    Text("</")
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                ZStack {
                    Image("canva")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .frame(width: 480, height: 484)
                    
                    canvaView
                }
                
                
                VStack{
                    Spacer()
                    HStack {
                        Text("/>")
                            .font(.system(size: 30))
                            .foregroundColor(.blue)
                            .fontWeight(.bold)
                        
                    }
                    
                }
            }
            .frame(height: 450)
            .font(.custom("kindergarten", size: 25))
            
                Button {
                    lines.removeAll()
                } label: {
                    Image(systemName: "trash.fill")
                        .font(.system(size: 25))
                        .frame(width: 60, height: 50)
                        .foregroundColor(.red)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.red, lineWidth: 7)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(x: 200, y: -30)
            
        }
        
    }
    
    func checkCollision() {
        if posXFixed - posX < 80 && posY - posYFixed < 80 {
           print("colidiu!")
            isColiding = true
        }
    }
    
    var canvaView: some View {
        VStack{
            Canvas { context, size in
                
                for line in lines {
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
                
                
            }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                    let newPoint = value.location
                    currentLine.points.append(newPoint)
                    self.lines.append(currentLine)
                })
                    .onEnded({ value in
                        self.currentLine = Line(points: [])
                    })
            )
            
            
        }.frame(width: 450, height: 450)
            .background(.white)
        
    }
}



//#Preview {
//    DrawingView()
//}
