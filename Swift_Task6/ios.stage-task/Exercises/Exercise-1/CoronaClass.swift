import Foundation

class CoronaClass {
 
     var seats = [Int]()
    private var tables = [Int: Int]()
     init(n: Int) {
        tables.removeAll()
        
        for i in 0..<n{
            tables[i] = 0
        }
     }
     
     func seat() -> Int {
        if(!tables.values.contains(1)){
            tables[0] = 1
            addSeatNumber()
            return 0
        }
        
        let occupiedSeats = Array(tables.filter{ $0.value == 1 }.keys).sorted()
        if(occupiedSeats.count == 1){
            let mid = tables.count/2
            var index = tables.count - 1
            
            if(occupiedSeats[0] > mid){
                index = 0
            }
            
            tables[index] = 1
            addSeatNumber()
            return index
        }
        
        var distanceMax = occupiedSeats[0] - 0
        var leftIndex = 0
        
        for i in 0..<occupiedSeats.count{
            var distance = 0
            if(i == occupiedSeats.count - 1){
                let rightIndex = tables.count - 1
                if(!occupiedSeats.contains(rightIndex)){
                    distance = rightIndex - occupiedSeats[i]
                    if((distance > distanceMax)){
                        tables[rightIndex] = 1
                        addSeatNumber()
                        return rightIndex
                    }
                }
            }
            else{
                distance = occupiedSeats[i+1] - occupiedSeats[i]
                if((distance/2 > distanceMax/2)){
                    distanceMax = distance
                    leftIndex = occupiedSeats[i]
                }
            }
        }
        
        let index = leftIndex + distanceMax/2
        if(tables[index] != 1){
            tables[index] = 1
        }
        addSeatNumber()
        return index
     }
     
     func leave(_ p: Int) {
        if(p >= 0 && p < tables.count){
            tables[p] = 0
        }
        removeSeatNumber()
     }
    
    func addSeatNumber() {
        seats.removeAll()
        
        if(!tables.values.contains(1)){
            return
        }
        
        for i in 0..<tables.count {
            if(tables[i] == 1){
                seats.append(i)
            }
        }
    }
    
    func removeSeatNumber(){
        seats.removeAll()
        addSeatNumber()
    }
}
