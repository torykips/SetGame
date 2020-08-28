//
//  Set.swift
//  SetGame
//
//  Created by Max on 8/23/20.
//  Copyright © 2020 Max. All rights reserved.
//

import Foundation
class Set{
    var availableCards = [Card]()
    var cardsInGame = [Card]()
    var selectedCards = [Card]()
    var hintCards = [Card]()
    
    var score = 0
    var foundSet = 0
    
    init() {
        newGame()
    }
    
    func generateAllCardsCombinations(){
        for color in CardColor.allValues{
            for symbol in CardSymbol.allValues{
                for number in CardNumber.allValues{
                    for shading in CardShading.allValues{
                        let card = Card(cardColor: color, cardSymbol: symbol, cardNumber: number, cardShading: shading)
                        availableCards.append(card)
                    }
                }
            }
        }
    }
    
    func newGame(){
        score = 0
        foundSet = 0
        cardsInGame.removeAll()
        availableCards.removeAll()
        selectedCards.removeAll()
        
        generateAllCardsCombinations()
        addCardsInGame(numberOfCardsToAdd: 12)
    }
    
    func addCard(){
        let selectedCard = availableCards.remove(at: availableCards.count.arc4random())
        cardsInGame.append(selectedCard)
    }
    
    func addCardsInGame(numberOfCardsToAdd: Int){
        for _ in 1...numberOfCardsToAdd{
            addCard()
        }
    }
    
    func cardIsSelected(card: Card)->Bool{
        return selectedCards.firstIndex(of: card) != nil
    }
    
    func isSet()->Bool{
        if selectedCards.count != 3 {
                return false
            }
            
        if selectedCards[0].cardColor == selectedCards[1].cardColor {
            if selectedCards[0].cardColor != selectedCards[2].cardColor {
                return false
            }
        } else if selectedCards[1].cardColor == selectedCards[2].cardColor {
            return false
        } else if (selectedCards[0].cardColor == selectedCards[2].cardColor) {
                return false
        }
            
        if selectedCards[0].cardNumber == selectedCards[1].cardNumber {
            if selectedCards[0].cardNumber != selectedCards[2].cardNumber {
                    return false
            }
        } else if selectedCards[1].cardNumber == selectedCards[2].cardNumber {
                return false
        } else if (selectedCards[0].cardNumber == selectedCards[2].cardNumber) {
                return false
        }
            
        if selectedCards[0].cardShading == selectedCards[1].cardShading {
            if selectedCards[0].cardShading != selectedCards[2].cardShading {
                return false
            }
        } else if selectedCards[1].cardShading == selectedCards[2].cardShading {
            return false
        } else if (selectedCards[0].cardShading == selectedCards[2].cardShading) {
            return false
        }
            
        if selectedCards[0].cardSymbol == selectedCards[1].cardSymbol {
            if selectedCards[0].cardSymbol != selectedCards[2].cardSymbol {
                return false
            }
        } else if selectedCards[1].cardSymbol == selectedCards[2].cardSymbol {
            return false
        } else if (selectedCards[0].cardSymbol == selectedCards[2].cardSymbol) {
            return false
        }
        
        return true
            
        
        }
    
    func select(card: Card){
        if let cardToSelect = selectedCards.firstIndex(of: card) {
            // Card is already selected, so remove it from the selection
            selectedCards.remove(at: cardToSelect)
        } else {
            selectedCards.append(card)
        }

        
        if selectedCards.count == 3 && isSet() {
            if cardsInGame.count == 12{
                selectedCards.forEach {
                    if let selectedCardInGameIndex = cardsInGame.firstIndex(of: $0) {
                        cardsInGame.remove(at: selectedCardInGameIndex)
                        if availableCards.count > 0 {
                            let selectedCard = availableCards.remove(at: availableCards.count.arc4random())
                            cardsInGame.insert(selectedCard, at: selectedCardInGameIndex)
                        }
                    }
                }
            }else{
                selectedCards.forEach {
                    if let selectedCardInGameIndex = cardsInGame.firstIndex(of: $0) {
                    cardsInGame.remove(at: selectedCardInGameIndex)
                    }
                }
            }
            
            score += 100
            foundSet += 1
            selectedCards.removeAll()
        } else if selectedCards.count == 3 && !isSet() {
            score -= 30
            selectedCards.removeAll()
        }
    }
    func findSet(){
        hintLoop: for firstCardIndex in cardsInGame.indices{
            for secondCardIndex in firstCardIndex+1..<cardsInGame.count{
                let identityCard = cardsInGame[firstCardIndex]=>cardsInGame[secondCardIndex]
                for thirdCardIndex in secondCardIndex+1..<cardsInGame.count{
                    if cardsInGame[thirdCardIndex]==identityCard{
                        hintCards.append(cardsInGame[firstCardIndex])
                        hintCards.append(cardsInGame[secondCardIndex])
                        hintCards.append(cardsInGame[thirdCardIndex])
                        break hintLoop
                    }
                }
            }
        }
        score -= 100
    }
        
}
