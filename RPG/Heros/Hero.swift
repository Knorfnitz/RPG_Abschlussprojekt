class Hero{
    var weapon: Weapon?
    let allowedWeaponTypes: [WeaponType]
    var armor: Armor?
    
    let name: String
    var fullHp: Int
    var hp: Int{
        didSet {
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
            if hp > fullHp {
                hp = fullHp
            }
        }
    }
    var fullMp: Int
    var mp: Int{
        didSet {
            // Sicherstellen, dass mp nie unter 0 fällt oder über fullMp hinausgeht
            if mp > fullMp {
                mp = fullMp
            } else if mp < 0 {
                mp = 0
            }
        }
    }
    var str: Int
    var def: Int
    var int: Int
    var dex: Int
    var lvl: Int = 1
    
    init(name: String, str: Int, def: Int, int: Int, dex: Int, allowedWeaponTypes: [WeaponType], weapon: Weapon?, armor: Armor?){
        self.name = name
        self.fullHp = str * 3 + def * 9
        self.hp = fullHp
        self.fullMp = Int(Double(dex) * 0.5 + Double(int) * 2.5)
        self.mp = fullMp
        self.str = str
        self.def = def
        self.int = int
        self.dex = dex
        self.allowedWeaponTypes = allowedWeaponTypes
        self.weapon = weapon
        self.armor = armor
    }
    
    func basicAttack(_ enemy: Enemy, _ critRate: Double){
        
        var damage = Int(Double(self.str - enemy.defense) * critRate)
        
        if damage <= 0 {
            damage = 0
            print("\(enemy.name) ist zu stark und nimmt keinen Schaden!")
        }else{
            print("\(self.name) greift \(enemy.name) mit einem Basisangriff für \(damage) Schaden an.\n")
            if critRate > 1 {
                print("Der Angriff war kritisch!")
            }
        }
        enemy.hp -= damage
    
    }
    


    
    
 
    
    func printDetails() {
        print("""
       *************************************************************************
                                                
                                                
                        Name:\t\t\t\t \(name)               
                                                            
                        HP:\t\t\t\t \(fullHp)                    
                        MP:\t\t\t\t \(fullMp)            
                        Stärke:\t\t\t \(str)                      
                        Verteidigung:\t\t \(def)     
                        Intelligenz:\t\t \(int)       
           
       """)
    }
    
    func printDetailsforTerminal() {
        
        let heroStats: [String] = ["HP:       \(fullHp)",
                                   "MP:       \(fullMp)",
                                   "Stärke:   \(str)",
                                   "Vert.:    \(def)",
                                   "Int:      \(int)",
                                   "\(voidString)",
                                   "\(voidString)",
                                   "\(name) wurde gewählt!",
                                   "\(voidString)",
                                   "Ist das richtig?",
                                   "\(voidString)",
                                   "Weiter mit Enter...)",
                                   "Oder Abbrechen mit beliebiger Eingabe"
                                    ]
        
        generateTerminalWindowWithSouls(topic: name, printArray: heroStats, in: terminalWidth)

    }
}


