//
//  ViewController.swift
//  Apple Pie
//
//  Created by Nicholas on 8/2/17.
//  Copyright © 2017 Nicholas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["honey", "lela", "luka", "dog", "apple" , "ball", "sasha", "paper", "trump", "wall", "state"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    var currentGame: Game!
    func newRound(){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    
    func updateUI() {
        var letters = [String] ()
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = ("Wins: \(totalWins), Losses: \(totalLosses)")
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState(){
        print("word: \(currentGame.word) Formatted word: \(currentGame.formattedWord)")
        if(currentGame.incorrectMovesRemaining == 0){
            totalLosses += 1
        }
        else if (currentGame.word == currentGame.formattedWord) {
            totalWins += 1
        }
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

