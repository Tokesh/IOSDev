

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(k: "All")
    
    private static func createMemoryGame(k:String) -> MemoryGame<String> {
        var emojis:Array<String>
        let emojisAll: Array<String> = ["๐ง ","๐งโโ๏ธ","๐งโโ๏ธ","๐งต","๐งถ","๐","๐งณ","๐ถ","๐ฆ","๐ฏ","๐ฆ","๐ต","๐ธ","๐ฎ","๐ท","๐ผ","๐จ","๐ฐ","๐น","๐ฆ","๐ฆ","๐","๐","๐บ","๐ฆ","๐ฆ","๐ด","๐","๐ฆ","๐","๐","๐ฆ","๐ฆ","๐ข","๐","๐ฆ","๐","๐","๐ค","๐ฉ","๐","๐ฃ","๐ฆท","๐ฌ","๐ณ","๐","๐ ","๐ก","๐ฆ","๐","๐ฆง","๐","๐ซ","๐พ","๐ฆฅ","๐ฆฆ","๐ฆจ","๐ต","๐","๐ด","๐ป","๐","๐น","๐ธ","๐ผ","โญ๏ธ","๐","๐ฅ","โ๏ธ","๐","๐","๐ฅฅ","๐ฅฉ","๐ง","๐","๐ค","๐ฅ","๐ฟ","๐","๐ช","๐ฉ","๐ง","โฝ๏ธ","๐","๐","๐","๐ฒ","๐","โ๏ธ","๐","๐ฟ","๐","๐ฐ","๐","๐","๐งผ","๐ฆ ","๐","๐ฆ", "๐ฅถ", "๐ป"]
        let emojisAnimalPack: Array<String> = ["๐ค","๐ฃ","๐ฅ","๐ฆ","๐ฆ","๐ฆ","๐ฆ","๐บ","๐","๐ด","๐ฆ","๐","๐ฆ","๐","๐","๐ฆ","๐ข","๐","๐ฆ","๐ฆ","๐","๐ฆ","๐ฆ","๐ ","๐ณ","๐","๐ฆ","๐","๐","๐ฆฆ","๐ฆจ","๐ฆ","๐ฟ","๐","๐","๐","๐ฆ","๐ฆ","๐พ","๐","๐ฆ","๐","๐ฆ","๐ฆง","๐ฏ","๐ปโโ๏ธ","๐ผ"]
        let emojisMadjong: Array<String> = ["๐ค","๐ฅ","๐ฆ","๐ง","๐จ","๐ฉ","๐ช","๐ซ","๐ฌ","๐ญ","๐ฎ","๐ฏ","๐ฐ","๐ฑ","๐ฒ","๐ณ","๐ด","๐ต","๐ถ","๐ท"]
        let emojisFlowers: Array<String> = ["๐น","๐บ","๐ธ","๐ท","๐ป","๐","๐ด","๐","๐ต"]
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
