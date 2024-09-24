import Foundation

class Enemy{
    let name: String
    var fullHp: Int
    var hp: Int {
        didSet{

            if hp <= fullHp/2 && oldValue > fullHp / 2 {
                print("\(name) ist geschwächt")
            
            }
            if hp <= Int((Double(fullHp) * 0.2)) && oldValue > Int((Double(fullHp) * 0.2)) {
                print("\(name) taumelt!")
                
            }
            if hp <= 0 && oldValue > 0{
                print("\(name) wurde besiegt")
                hp = 0
            }
        }
    }
    var damage: Int
    var defense: Int
    var lvl: Int = 1
    let monsterIndex: Double //Je nach Monster ein Multiplikator
    let rare: Int // Wert 1..3, dient als multiplikator für seltene Monster
    var souls: Int // Seelen beim besiegen

    
    //let weakness: String
    
    init(name: String, rare: Int, monsterIndex: Double) {
        self.name = name
        self.fullHp = Int(Double(lvl * 50 * rare) * monsterIndex)
        self.hp = fullHp
        self.damage = Int(Double(lvl * 10 * rare) * monsterIndex)
        self.defense = Int(Double(lvl * 1 * rare) * monsterIndex)
        self.rare = rare
        self.souls = Int(Double(lvl * 70 * rare) * monsterIndex)
        self.monsterIndex = monsterIndex
    }
      
    func increaseLvl(_ addlvl: Int){
        lvl += addlvl-1
        fullHp = Int(Double(addlvl * 50 * rare) * monsterIndex)
        hp = fullHp
        damage = Int(Double(addlvl * 10 * rare) * monsterIndex)
        defense = Int(Double(addlvl * 1 * rare) * monsterIndex)
        souls = Int(Double(addlvl * 70 * rare) * monsterIndex)
        
    }
    
    func printDetails() {
        print("Name: \(name)")
        print("Lvl: \(lvl)")
        print("HP: \(hp)")
        print("Attack: \(damage)")
        print("Defense: \(defense)")
        print("Rare: \(rare)")
        print("Souls: \(souls)")
    }
    
    
}

//leerer Gegner
let emptyEnemy: Enemy = Enemy(name: "XXX", rare: 1, monsterIndex: 0)
