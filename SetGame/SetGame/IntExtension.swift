//
//  IntExtension.swift
//  SetGame
//
//  Created by Max on 8/23/20.
//  Copyright © 2020 Max. All rights reserved.
//

import Foundation
extension Int{
    func arc4random()->Int{
        let randomNumber = Int(arc4random_uniform(UInt32(self)))
        return randomNumber
    }
}
