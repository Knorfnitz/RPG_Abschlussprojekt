import Foundation

class Enemy{
    var name: String{
        didSet{
            switch rare {
            case ..<2:
                prefix = "👻"
            case 2..<3:
                prefix = "👿"
            case 3..<4:
                prefix = "👺"
            case 4..<10:
              prefix = "💀"
            case 10:
                prefix = "😼"
            default :
                prefix = "❓"
            }
        }
    }
    var fullHp: Int
    var hp: Int {
        didSet{

            if hp <= fullHp/2 {
               // suffix = " (geschwächt)"
            }
            if hp <= Int((Double(fullHp) * 0.2)) && oldValue > Int((Double(fullHp) * 0.2)) {
               // suffix = " (taumelt)"
            }
            if hp <= 0 && oldValue > 0{
               // suffix = " XXX(tot)XXX"
            }
        }
    }
    var damage: Int
    var defense: Int
    var lvl: Int = 1
    let monsterIndex: Double //Je nach Monster ein Multiplikator
    let rare: Int // Wert 1..3, dient als multiplikator für seltene Monster
    var souls: Int // Seelen beim besiegen
    private var suffix: String = ""
    private var prefix: String = ""

    
    //let weakness: String
    
    init(name: String, rare: Int, monsterIndex: Double) {
        self.name = name
        self.fullHp = Int(Double(lvl * 75) * monsterIndex)
        self.hp = fullHp
        self.damage = Int(Double(lvl * 8) * monsterIndex)
        self.defense = Int(Double(lvl * 2) * monsterIndex)
        self.rare = rare
        self.souls = Int(Double(lvl * 70) * monsterIndex)
        self.monsterIndex = monsterIndex
    }
    
    var enemyForPrint: String {
        return "\(prefix)\(name)\(suffix)"
    }
      
    func increaseLvl(_ addlvl: Int){
        lvl += addlvl-1
        fullHp = Int(Double(addlvl * 75) * monsterIndex)
        hp = fullHp
        damage = Int(Double(addlvl * 15) * monsterIndex)
        defense = Int(Double(addlvl * 20) * monsterIndex)
        souls = Int(Double(addlvl * 70) * Double(rare))
        
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
