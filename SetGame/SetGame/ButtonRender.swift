//
//  ButtonRender.swift
//  SetGame
//
//  Created by Max on 8/23/20.
//  Copyright © 2020 Max. All rights reserved.
//

import Foundation
import UIKit
class ButtonRender{
    static func getColor(ofCard card: Card)->UIColor{
        switch card.cardColor {
        case .red:
            return #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        case .green:
            return #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        case .purple:
            return #colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)
        }
    }
    
    static func getSymbol(ofCard card: Card)->String{
        switch card.cardSymbol {
        case .circle:
            return "●"
        case .square:
            return "◼︎"
        case .triangle:
            return "▲"
        }
    }
    
    static func getTitle(ofCard card: Card, usingSymbol symbol: String)->String{
        switch card.cardNumber {
        case .one:
            return "\(symbol)"
        case .two:
            return "\(symbol) \(symbol)"
        case .three:
            return "\(symbol) \(symbol) \(symbol)"
        }
    }
    
    static func getAttributedTitle(ofCard card: Card, title: String, withColor color: UIColor)->NSAttributedString{
        var attributes:[NSAttributedString.Key: Any] = [:]
        switch card.cardShading {
        case .blank:
            attributes[.strokeWidth] = 4
            attributes[.foregroundColor] = color
        case .solid:
            attributes[.strokeWidth] = -1
            attributes[.foregroundColor] = color
        case .stripped:
            attributes[.strokeWidth] = -1
            attributes[.foregroundColor] = color.withAlphaComponent(0.25)
        }
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    static func renderCard(cardToRender card: Card, onButton: UIButton, selectButton: Bool, isSet: Bool) {
        
        let buttonColor = getColor(ofCard: card)
        let cardSymbol = getSymbol(ofCard: card)
        let buttonTitle = getTitle(ofCard: card, usingSymbol: cardSymbol)
        let attributedTitle = getAttributedTitle(ofCard: card, title: buttonTitle, withColor: buttonColor)
        
        onButton.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        
        if selectButton {
            if isSet {
                onButton.select(borderColor: #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1))
            } else {
                onButton.select()
            }
        } else {
            onButton.deselect()
        }
    }
}
