import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    
    @StateObject var screenManager: ScreenManager = ScreenManager()
    @State var canPlay = false
    
    @State var shape: String = "shape"
    
    @State var posX: CGFloat = -150.0
    @State var posY: CGFloat = 150.0
    
    @State var posXFixed: CGFloat = 140
    @State var posYFixed: CGFloat = -140
    
    @State var isColiding = false
    @State var showApple = true
    
    @State var coord:[String] = []
    @State var auxCoord:[String] = []
    
    @State var showDialogue = false
    @State var showTutorialDialogue = true
    @State var canShowDialogue = false
    @State var showMenu = false
    @State var canInteract = false
    @State var neverShowDialogueAgain = false
    
    var body: some View {
        NavigationStack{
                HStack{
                    VStack {
                        Spacer()
                        Image("boneco")
                            .resizable()
                            .frame(width: 300, height: 300)
                        
                    }
                    .padding(0)
                    
                    VStack {
                        Image("bandeira")
                            .resizable()
                            .frame(width: 750, height: 200)
                        
                        Spacer()
                        
                        VStack{
                            switch screenManager.tela {
                                
                            case .dumbMachine:
                                dumbMachine
                                    .transition(.opacity)
                                
                                
                            case .introdution:
                                introdution
                                    .transition(.opacity)
                                
                            case .algorithm:
                                algorithm
                                    .transition(.opacity)
                                
                            case .example:
                                example
                                    .transition(.opacity)
                                
                            case .tutorial:
                                tutorial
                                    .transition(.opacity)
                            case .tutorial2:
                                tutorial2
                                    .transition(.opacity)
                            }
                        }
                        .padding(.leading, 70)
                        
                        
                        Spacer()
                        
                        
                    }
                    .frame(width: .infinity, height: .infinity)
                }
                .preferredColorScheme(.light)
            .padding(.horizontal,20)
            .font(.custom("kindergarten", size: 30))
            }
            
    }
    
    // ---------- screens ----------
    
    var dumbMachine: some View {
        VStack {
            Spacer()
            VStack(spacing: 20){
                Text("Have you ever wondered how the computer knows what to do?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Well, the answer is: they don't know!")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("That's right, computers are dumb!")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .multilineTextAlignment(.leading)
            Spacer()
            HStack{
                if canPlay {
                    NavigationLink {
                        GameplayView(posX: $posX, posY: $posY, shape: $shape, posXFixed: $posXFixed, posYFixed: $posYFixed, isColiding: $isColiding, showApple: $showApple, coord: $coord, auxCoord: $auxCoord, showDialogue: $showDialogue, showTutorialDialogue: $showTutorialDialogue, canShowDialogue: $canShowDialogue, showMenu: $showMenu, canInteract: $canInteract, neverShowDialogueAgain: $neverShowDialogueAgain)
                    } label: {
                        VStack{
                            Text("Play")
                                .font(.custom("kindergarten", size: 50))
                        }
                        .frame(width: 110, height: 60)
                        .background(.white)
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 7)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Button {
                    
                    withAnimation(.spring()) {
                        screenManager.tela = .introdution
                    }
                    
                } label: {
                    VStack{
                        Image("setadireita")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .padding(.bottom, 70)
        }
        .frame(width: 760, height: .infinity)
        .preferredColorScheme(.light)
        .navigationBarBackButtonHidden(true)
        
    }
    
    var introdution: some View {
        VStack {
            Spacer()
            VStack(spacing: 20){
                Text("Thanks to someone giving the orders, computers receive instructions and carry out tasks, they don't know what they have to do on their own.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("And all this happens through programming.")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .multilineTextAlignment(.leading)
            Spacer()
            HStack{
                if canPlay {
                    NavigationLink {
                        GameplayView(posX: $posX, posY: $posY, shape: $shape, posXFixed: $posXFixed, posYFixed: $posYFixed, isColiding: $isColiding, showApple: $showApple, coord: $coord, auxCoord: $auxCoord, showDialogue: $showDialogue, showTutorialDialogue: $showTutorialDialogue, canShowDialogue: $canShowDialogue, showMenu: $showMenu, canInteract: $canInteract, neverShowDialogueAgain: $neverShowDialogueAgain)
                    } label: {
                        VStack{
                            Text("Play")
                                .font(.custom("kindergarten", size: 50))
                        }
                        .frame(width: 110, height: 60)
                        .background(.white)
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 7)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Button {
                    
                    withAnimation(.spring()) {
                        screenManager.tela = .dumbMachine
                    }
                    
                } label: {
                    VStack{
                        Image("setaesquerda")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button {
                    withAnimation(.spring()) {
                        screenManager.tela = .algorithm
                    }
                } label: {
                    VStack{
                        Image("setadireita")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                
                
                
        
            }
            .padding(.bottom, 70)
        }
        .preferredColorScheme(.light)
        .frame(width: 760, height: .infinity)
        .navigationBarBackButtonHidden(true)
    }
    
    var algorithm: some View {
        VStack {
            Spacer()
            VStack(spacing: 20){
                Text("Programming is the language we use to communicate with computers.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("We can communicate and pass commands to them using many different languages.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("When we have a sequence of these commands forming a step-by-step, we have an algorithm, which the computer has to follow to know what to do.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Well, someone always has to tell him!")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .multilineTextAlignment(.leading)
            Spacer()
            HStack{
                
                if canPlay {
                    NavigationLink {
                        GameplayView(posX: $posX, posY: $posY, shape: $shape, posXFixed: $posXFixed, posYFixed: $posYFixed, isColiding: $isColiding, showApple: $showApple, coord: $coord, auxCoord: $auxCoord, showDialogue: $showDialogue, showTutorialDialogue: $showTutorialDialogue, canShowDialogue: $canShowDialogue, showMenu: $showMenu, canInteract: $canInteract, neverShowDialogueAgain: $neverShowDialogueAgain)
                    } label: {
                        VStack{
                            Text("Play")
                                .font(.custom("kindergarten", size: 50))
                        }
                        .frame(width: 110, height: 60)
                        .background(.white)
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 7)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Button {
                    
                    withAnimation(.spring()) {
                        screenManager.tela = .introdution
                    }
                    
                } label: {
                    VStack{
                        Image("setaesquerda")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button {
                    withAnimation(.spring()) {
                        screenManager.tela = .example
                    }
                } label: {
                    VStack{
                        Image("setadireita")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                
                
        
            }
            .padding(.bottom, 70)
        }
        .preferredColorScheme(.light)
        .frame(width: 760, height: .infinity)
        .navigationBarBackButtonHidden(true)
    }
    
    var example: some View {
        VStack {
            Spacer()
            VStack(spacing: 20){
                Text("Let's use arrows as an example.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 70){
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(90))
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(180))
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(-90))
                }
                Text("Each arrow is an instruction and together they form an algorithm!")
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 70){
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(90))
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(90))
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(90))
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(180))
                }
            }
            .multilineTextAlignment(.leading)
            Spacer()
            HStack{
                if canPlay {
                    NavigationLink {
                        GameplayView(posX: $posX, posY: $posY, shape: $shape, posXFixed: $posXFixed, posYFixed: $posYFixed, isColiding: $isColiding, showApple: $showApple, coord: $coord, auxCoord: $auxCoord, showDialogue: $showDialogue, showTutorialDialogue: $showTutorialDialogue, canShowDialogue: $canShowDialogue, showMenu: $showMenu, canInteract: $canInteract, neverShowDialogueAgain: $neverShowDialogueAgain)
                    } label: {
                        VStack{
                            Text("Play")
                                .font(.custom("kindergarten", size: 50))
                        }
                        .frame(width: 110, height: 60)
                        .background(.white)
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 7)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Button {
                    
                    withAnimation(.spring()) {
                        screenManager.tela = .algorithm
                    }
                    
                } label: {
                    VStack{
                        Image("setaesquerda")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button {
                    withAnimation(.spring()) {
                        screenManager.tela = .tutorial
                    }
                } label: {
                    VStack{
                        Image("setadireita")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                
        
            }
            .padding(.bottom, 70)
        }
        .preferredColorScheme(.light)
        .frame(width: 760, height: .infinity)
        .navigationBarBackButtonHidden(true)
    }
    
    var tutorial: some View {
        VStack {
            Spacer()
            VStack(spacing: 20){
                Text("Let's see how this works in practice?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("We have to help the Dumb Machine collect the apple.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 70){
                    Image("bonecoIdle")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Image("apple")
                        .resizable()
                        .frame(width: 80, height: 80)
                }
                
                Text("To do this, draw arrows to tell him which direction to move.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 70){
                    Image("bonecoIdle")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(90))
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(180))
                    Image("seta")
                        .resizable()
                        .frame(width: 40, height: 80)
                        .rotationEffect(.degrees(-90))
                }
            }
            .multilineTextAlignment(.leading)
            Spacer()
            HStack{
                if canPlay {
                    NavigationLink {
                        GameplayView(posX: $posX, posY: $posY, shape: $shape, posXFixed: $posXFixed, posYFixed: $posYFixed, isColiding: $isColiding, showApple: $showApple, coord: $coord, auxCoord: $auxCoord, showDialogue: $showDialogue, showTutorialDialogue: $showTutorialDialogue, canShowDialogue: $canShowDialogue, showMenu: $showMenu, canInteract: $canInteract, neverShowDialogueAgain: $neverShowDialogueAgain)
                    } label: {
                        VStack{
                            Text("Play")
                                .font(.custom("kindergarten", size: 50))
                        }
                        .frame(width: 110, height: 60)
                        .background(.white)
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 7)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Button {
                    
                    withAnimation(.spring()) {
                        screenManager.tela = .example
                    }
                    
                } label: {
                    VStack{
                        Image("setaesquerda")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button {
                    withAnimation(.spring()) {
                        screenManager.tela = .tutorial2
                        
                        canPlay = true
                    }
                } label: {
                    VStack{
                        Image("setadireita")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
        
            }
            .padding(.bottom, 70)
        }
        .preferredColorScheme(.light)
        .frame(width: 760, height: .infinity)
        .navigationBarBackButtonHidden(true)
    }
    
    var tutorial2: some View {
        VStack {
            Spacer()
            VStack(spacing: 20){
                
                Text("Draw a heart to tell him to pick up the apple.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 70){
                    Image("bonecoIdle")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Image("heartDraw")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Image("apple")
                        .resizable()
                        .frame(width: 80, height: 80)
                }
            }
            .multilineTextAlignment(.leading)
            Spacer()
            HStack{
                if canPlay {
                    NavigationLink {
                        GameplayView(posX: $posX, posY: $posY, shape: $shape, posXFixed: $posXFixed, posYFixed: $posYFixed, isColiding: $isColiding, showApple: $showApple, coord: $coord, auxCoord: $auxCoord, showDialogue: $showDialogue, showTutorialDialogue: $showTutorialDialogue, canShowDialogue: $canShowDialogue, showMenu: $showMenu, canInteract: $canInteract, neverShowDialogueAgain: $neverShowDialogueAgain)
                    } label: {
                        VStack{
                            Text("Play")
                                .font(.custom("kindergarten", size: 50))
                        }
                        .frame(width: 110, height: 60)
                        .background(.white)
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.blue, lineWidth: 7)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
                Button {
                    
                    withAnimation(.spring()) {
                        screenManager.tela = .tutorial
                    }
                    
                } label: {
                    VStack{
                        Image("setaesquerda")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 110, height: 60)
                    .background(.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 7)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                
                
                
        
            }
            .padding(.bottom, 70)
        }
        .preferredColorScheme(.light)
        .frame(width: 760, height: .infinity)
        .navigationBarBackButtonHidden(true)
    }
    
    
}

//#Preview {
//    ContentView()
//}
