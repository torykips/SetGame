//
//  ViewController.swift
//  SetGame
//
//  Created by Max on 8/23/20.
//  Copyright © 2020 Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var addThreeCards: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var foundSetLabel: UILabel!
    @IBOutlet weak var cardsLeftLabel: UILabel!
    var game = Set()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButtons()
        updateViewFromModel()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        addThreeCards.isEnabled = true
        game.newGame()
        resetButtons()
        updateViewFromModel()
        
    }
    
    func resetButtons(){
        for buttonIndex in cardButtons.indices{
            let button = cardButtons[buttonIndex]
            button.deselect()
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
            button.layer.cornerRadius = 10
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0)
            button.layer.borderColor = #colorLiteral(red: 1, green: 0.5768225789, blue: 0, alpha: 0)
            button.setAttributedTitle(nil, for: UIControl.State.normal)
        }
    }
    
    @IBAction func findSet(_ sender: UIButton) {
        game.findSet()
        game.hintCards.forEach{
            cardButtons[game.cardsInGame.firstIndex(of: $0)!].layer.borderWidth = 3.0
            cardButtons[game.cardsInGame.firstIndex(of: $0)!].layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            game.hintCards.removeAll()
        }
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender){
            if cardIndex < game.cardsInGame.count{
                game.select(card: game.cardsInGame[cardIndex])
            }
            updateViewFromModel()
        }
        
    }
    
    @IBAction func addThreeCard(_ sender: UIButton) {
        game.addCardsInGame(numberOfCardsToAdd: 3)
        updateViewFromModel()
        if game.cardsInGame.count >= 24{
            addThreeCards.isEnabled = false
        }
    }
    
    func updateViewFromModel(){
        var cardButtonIndex = 0
        resetButtons()
        scoreLabel.text = "Score: \(game.score)"
        foundSetLabel.text = "Found Set(s): \(game.foundSet)"
        cardsLeftLabel.text = "Cards left: \(game.availableCards.count)"
        addThreeCards.isEnabled = (game.cardsInGame.count != 24)
        for card in game.cardsInGame{
            let button = cardButtons[cardButtonIndex]
            ButtonRender.renderCard(cardToRender: card, onButton: button, selectButton: game.cardIsSelected(card: card), isSet: game.isSet())
            cardButtonIndex += 1
        }
    }
    
}

