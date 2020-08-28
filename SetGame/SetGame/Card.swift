//
//  Card.swift
//  SetGame
//
//  Created by Max on 8/23/20.
//  Copyright © 2020 Max. All rights reserved.
//
infix operator =>: ComparisonPrecedence

import Foundation
struct Card: Equatable {
    let cardColor: CardColor
    let cardSymbol: CardSymbol
    let cardNumber: CardNumber
    let cardShading: CardShading
    
    static func ==(left: Card, right: Card)->Bool{
        return left.cardColor == right.cardColor &&
            left.cardSymbol == right.cardSymbol &&
            left.cardNumber == right.cardNumber &&
            left.cardShading == right.cardShading
    }
    static func =>(left: Card, right: Card)->Card{
        var color: CardColor{
            get{
                if left.cardColor == right.cardColor{
                    return left.cardColor
                }else{
                    return CardColor.allValues.filter{$0 != left.cardColor && $0 != right.cardColor}.first!
                }
            }
        }
        var symbol: CardSymbol{
            get{
                if left.cardSymbol == right.cardSymbol{
                    return left.cardSymbol
                }else{
                    return CardSymbol.allValues.filter { $0 != left.cardSymbol && $0 != right.cardSymbol}.first!
                }
            }
        }
        var number: CardNumber{
            get{
                if left.cardNumber == right.cardNumber{
                    return left.cardNumber
                }else{
                    return CardNumber.allValues.filter { $0 != left.cardNumber && $0 != right.cardNumber}.first!
                }
            }
        }
        var shading: CardShading{
            get{
                if left.cardShading == right.cardShading{
                    return left.cardShading
                }else{
                    return CardShading.allValues.filter {$0 != left.cardShading && $0 != right.cardShading}.first!
                }
            }
        }
        return Card(cardColor: color, cardSymbol: symbol, cardNumber: number, cardShading: shading)
    }
}

enum CardColor{
    case red
    case green
    case purple
    static let allValues = [red, green, purple]
}
enum CardSymbol{
    case circle
    case square
    case triangle
    static let allValues = [circle, square, triangle]
}
enum CardNumber {
    case one
    case two
    case three
    static let allValues = [one, two, three]
}
enum CardShading{
    case blank
    case solid
    case stripped
    static let allValues = [blank, solid, stripped]
}
