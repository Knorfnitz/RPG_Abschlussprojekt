class Hero{
    let name: String
    let fullHp: Int
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
            }
        }
    let fullMp: Int
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
    
   init(name: String, str: Int, def: Int, int: Int, dex: Int){
        self.name = name
        self.fullHp = str * 3 + def * 9
        self.hp = fullHp
        self.fullMp = dex * 1 + int * 3
        self.mp = fullMp
        self.str = str
        self.def = def
        self.int = int
        self.dex = dex
     
    }
    
    func basicAttack(_ enemy: Enemy){
        let damage = self.str - enemy.defense
        print("\(self.name) greift \(enemy.name) mit einem Basisangriff für \(damage) Schaden an.")
        //hero.damage(damage)
        //print(enemie.hp)
        enemy.hp -= damage
        //print("Verbleibende HP:\(enemie.hp)") //geheim!
    }
    
    func damage(_ damage: Int){
        self.hp -= damage
    }
    
    func heal(_ heal: Int){
        self.hp += heal
    }
    
    func revive(){
        self.hp = 100
    }
    
    func lvlup(){
        
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
    
}
