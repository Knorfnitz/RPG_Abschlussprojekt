class Hero{
    let name: String
    let fullHp: Int
    var hp: Int{
        didSet {
            // Sicherstellen, dass hp nie unter 0 fällt oder über fullHp hinausgeht
            if hp > fullHp {
                hp = fullHp
            } else if hp < 0 {
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
    
    func basicAttack(_ hero: Hero){
        let damage = self.str - hero.def
        hero.damage(damage)
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
