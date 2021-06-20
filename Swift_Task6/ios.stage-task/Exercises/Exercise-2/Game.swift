//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var player: Player?
        
        if(players.count > 0){
            var minTrump: Value?
            
            for p in players{
                let filtered = p.hand?.filter{ card in return card.isTrump}
                if let min = filtered?.min(by: { a, b in a.value.rawValue < b.value.rawValue }){
                    if let m = minTrump{
                        if(min.value.rawValue < m.rawValue){
                            player = p
                            minTrump = min.value
                        }
                    }
                    else{
                        player = p
                        minTrump = min.value
                    }
                }
            }
        }
        
        return player
    }
}
