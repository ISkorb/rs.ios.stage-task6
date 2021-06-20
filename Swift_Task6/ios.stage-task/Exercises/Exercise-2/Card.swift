import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, CaseIterable, Codable {
    case six = 1
    case seven = 2
    case eight = 3
    case nine = 4
    case ten = 5
    case jack = 6
    case queen = 7
    case king = 8
    case ace = 9
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {
        hasher.combine(suit)
        hasher.combine(value)
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.suit == rhs.suit && lhs.value == rhs.value
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        if(!card.isTrump){
            if(self.isTrump){
                return true
            }
            else{
                return (card.suit == self.suit && card.value.rawValue < self.value.rawValue)
            }
        }
        else{
            if(self.isTrump){
                return self.value.rawValue > card.value.rawValue
            }
        }
        return false
    }

    func checkValue(card: Card) -> Bool {
        return false
    }
}
