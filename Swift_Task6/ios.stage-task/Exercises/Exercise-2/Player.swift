//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        if let h = hand {
            return h.filter{ c in return c.value == card.value }.count > 0
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        if let h = hand {
            for s in table{
                if(h.filter{ c in return (c.value == s.key.value || c.value == s.value.value)}.count > 0){
                    return true
                }
            }
        }
        return false
    }
}
