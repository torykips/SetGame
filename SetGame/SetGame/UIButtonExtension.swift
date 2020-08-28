//
//  UIButtonExtension.swift
//  SetGame
//
//  Created by Max on 8/23/20.
//  Copyright © 2020 Max. All rights reserved.
//

import Foundation
import UIKit
extension UIButton{
    func isSelected()->Bool{
        return self.layer.borderWidth == 4.0
    }
    func select(borderColor : UIColor = #colorLiteral(red: 0.57, green: 0.57, blue: 0.57, alpha: 1)){
        self.layer.borderWidth = 4.0
        self.layer.borderColor = borderColor.cgColor
        self.layer.backgroundColor = #colorLiteral(red: 0.754, green: 0.7540688515, blue: 0.754, alpha: 1)
    }
    func deselect(){
        self.layer.borderWidth = 2.0
        self.layer.borderColor = #colorLiteral(red: 0.754, green: 0.7540688515, blue: 0.754, alpha: 1)
        self.layer.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.921431005, blue: 0.921, alpha: 1)
    }
}
