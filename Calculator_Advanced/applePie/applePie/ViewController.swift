//
//  ViewController.swift
//  applePie
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var treeIMG: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["attendance", "language", "experiment", "goal", "speedrun", "menu", "mirror", "success", "agai" , "chief", "happy", "private"]
    let incorrectMovesAllowed = 7
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        // Do any additional setup after loading the view.
    }
    @IBAction func butPressed(_ sender: UIButton){
        sender.isEnabled = false
        print(sender.titleLabel!.text!)
        let letterString = sender.titleLabel!.text!
        let letterc = letterString.lowercased()
        currentGame.playerGuessed(letter: Character(letterc))
        updateGameState()
    }
    func newRound(){
        if(!listOfWords.isEmpty){
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }else{
            enableLetterButtons(false)
        }
        
        
    }
    func enableLetterButtons(_ enable:Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scorelabel.text = "Wins: \(totalWins), losses: \(totalLosses)"
        treeIMG.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        }else if(currentGame.word == currentGame.formattedWord){
            totalWins += 1
        }else{
            updateUI()
        }
        print(currentGame.word)
        print(currentGame.formattedWord)
    }
}

