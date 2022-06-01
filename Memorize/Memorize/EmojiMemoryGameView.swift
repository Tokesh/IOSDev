

import SwiftUI

let casualGameTimer = 60
struct EmojiMemoryGameView: View {
    @State var currentMode = "All"
    @State var timeRemaining = casualGameTimer
    @State var working = true
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack(spacing:45) {
                Text("\(timeRemaining)")
                            .onReceive(timer) { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                    
                                }else{
                                    test.counter = 0
                                    test.target = 1
                                    timeRemaining = casualGameTimer
                                    self.viewModel.resetGame(z: self.currentMode)
                                }
                            }
                
                if(working){
                    Button(action: {
                        self.timer.upstream.connect().cancel()
                        self.working = false
                        
                    }, label: { Text("Pause") })
                    Text("\(test.counter)")
                    Text("Level:\(test.target)")
                }else{
                    Button(action: {
                        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        self.working = true
                    }, label: { Text("Unpause") })
                }
                Button(action: {
                    withAnimation(.easeInOut) {
                        self.viewModel.resetGame(z: self.currentMode)
                        self.working = true
                        test.counter = 0
                        test.target = 1
                        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        timeRemaining = casualGameTimer
                    }
                }, label: { Text("New Game") })
            }.padding(.top)
            if(working){
                if((test.counter) % 9 == 0 && test.counter != 0){
                    Text("You won this").padding(.top)
                    Button(action: {
                            test.rr = true
                            test.counter = 0
                            test.target += 1
                            self.viewModel.resetGame(z: self.currentMode)
                            self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        timeRemaining = casualGameTimer - test.target
                    }, label: { Text("Continue it") }).padding(25)
                    
                }else{
                    Grid(viewModel.cards) { card in
                        CardView(card: card).onTapGesture {
                            withAnimation(.linear(duration: 0.5)) {
                                self.viewModel.choose(card: card)
                            }
                        }
                        .padding(5)
                    }
                    .padding()
                    .foregroundColor(Color.blue)
                }
                
            }else{
                Text("Create new game with another theme: ").padding(25)
                Button(action: {
                        self.currentMode = "All"
                        self.viewModel.resetGame(z: self.currentMode)
                        test.counter = 0
                        test.target = 1
                        self.working = true
                        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        timeRemaining = casualGameTimer
                }, label: { Text("All") }).padding(25)
                Button(action: {
                        self.currentMode = "Animal"
                        self.viewModel.resetGame(z: self.currentMode)
                        test.counter = 0
                        test.target = 1
                        self.working = true
                        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        timeRemaining = casualGameTimer
                }, label: { Text("Animals") }).padding(25)
                Button(action: {
                        self.currentMode = "Madjong"
                        self.viewModel.resetGame(z: self.currentMode)
                        test.counter = 0
                        test.target = 1
                        self.working = true
                        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        timeRemaining = casualGameTimer
                }, label: { Text("Madjong") }).padding(25)
                Button(action: {
                        self.currentMode = "Flowers"
                        self.viewModel.resetGame(z: self.currentMode)
                        test.counter = 0
                        test.target = 1
                        self.working = true
                        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        timeRemaining = casualGameTimer
                }, label: { Text("Flowers") }).padding(25)
            }
            
            
           
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched{
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                            .onAppear {
                                self.startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                    }
                }
                .padding(5).opacity(0.4)
                .transition(.identity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
//                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
//                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
  
    
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
