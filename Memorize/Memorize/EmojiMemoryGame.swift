

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(k: "All")
    
    private static func createMemoryGame(k:String) -> MemoryGame<String> {
        var emojis:Array<String>
        let emojisAll: Array<String> = ["🧠","🧟‍♀️","🧛‍♂️","🧵","🧶","🎓","🧳","🐶","🦊","🐯","🦁","🐵","🐸","🐮","🐷","🐼","🐨","🐰","🐹","🦉","🦆","🐔","🐗","🐺","🦇","🦄","🐴","🐌","🦋","🐝","🐞","🦕","🦖","🐢","🐙","🦐","😄","😎","🤓","💩","🎃","👣","🦷","🐬","🐳","🐟","🐠","🐡","🦈","🐊","🦧","🐘","🐫","🐾","🦥","🦦","🦨","🌵","🎄","🌴","👻","🍂","🌹","🌸","🌼","⭐️","🌍","🔥","☃️","🍏","🍎","🥥","🥩","🧀","🍗","🍤","🥟","🍿","🎂","🍪","🍩","🧁","⚽️","🏀","🏈","🏆","🎲","🚕","✈️","🚀","🗿","🌋","💰","💎","💊","🧼","🦠","🎁","📦", "🥶", "👻"]
        let emojisAnimalPack: Array<String> = ["🐤","🐣","🐥","🦅","🦆","🦉","🦇","🐺","🐗","🐴","🦄","🐝","🦋","🐌","🐜","🦂","🐢","🐍","🦎","🦕","🐙","🦐","🦞","🐠","🐳","🐋","🦒","🐏","🐕","🦦","🦨","🦔","🐿","🐓","🐄","🕊","🦜","🦚","🐾","🐎","🦙","🐘","🦍","🦧","🐯","🐻‍❄️","🐼"]
        let emojisMadjong: Array<String> = ["🁤","🁥","🁦","🁧","🁨","🁩","🁪","🁫","🁬","🁭","🁮","🁯","🁰","🁱","🁲","🁳","🁴","🁵","🁶","🁷"]
        let emojisFlowers: Array<String> = ["🌹","🌺","🌸","🌷","🌻","🍀","🌴","🍄","🌵"]
        if(k == "All"){
            emojis = emojisAll[randomPick: 9]
        }else if(k=="Animal"){
            emojis = emojisAnimalPack[randomPick: 9]
        }else if(k=="Madjong"){
            emojis = emojisMadjong[randomPick: 9]
        }else if(k=="Flowers"){
            emojis = emojisFlowers[randomPick: 9]
        }
        else{
            print("else")
            emojis = emojisAll[randomPick: 9]
        }
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
  
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    

    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame(z:String) {
        model = EmojiMemoryGame.createMemoryGame(k:z)
    }
    
}
