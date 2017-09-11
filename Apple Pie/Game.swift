//
//  Game.swift
//  Apple Pie
//
//  Created by Nicholas on 8/2/17.
//  Copyright © 2017 Nicholas. All rights reserved.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.characters.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    
    var formattedWord:String{
        var guessedWord = ""
        for letter in word.characters{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
                print (guessedWord)
            }
            else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
}
