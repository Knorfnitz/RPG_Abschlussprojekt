struct Armor{
    let name: String
    var extraHP: Int
    var extraDEF: Int
    var amount: Int = 0
    let sellPrice: Int
    
    
    
mutating func reduceAmount(amount: Int) -> Int{
        let newAmount:Int = self.amount - amount
    self.amount = newAmount
    print(self.amount)
        return newAmount
        
    }
    
    mutating func increaseAmount(amount: Int){
        self.amount += amount
    }
    
}

let armorWood = Armor(name: "Holzrüstung", extraHP: 50, extraDEF: 10, sellPrice: 500)
let armorIron = Armor(name: "Eisenrüstung", extraHP: 100, extraDEF: 20, sellPrice: 1000)
let armorSteel = Armor(name: "Stahlrüstung", extraHP: 200, extraDEF: 40, sellPrice: 2000)
let armorSilver = Armor(name: "Silberrüstung", extraHP: 500, extraDEF: 100, sellPrice: 4000)
let armorGold = Armor(name: "Goldrüstung", extraHP: 1000, extraDEF: 250, sellPrice: 10000)
let armorMythril = Armor(name: "Mythrilrüstung", extraHP: 5000, extraDEF: 500, sellPrice: 20000)
