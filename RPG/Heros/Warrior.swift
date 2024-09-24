class Warrior: Hero {
    let weapontype1: WeaponType = .sword
    let weapontype2: WeaponType = .swordAndShild
    
    override init(name: String, str: Int, def: Int, int: Int, dex: Int) {
        super.init(name: name, str: str, def: def, int: int, dex: dex)
        
    }
    
    override func printDetails() {
        super.printDetails()
        print("""
                 Waffentyp 1:\t\t \(weapontype1.rawValue)
                 Waffentxp 2:\t\t \(weapontype2.rawValue)
    
*************************************************************************
""")
    }
        func printDetails2() {
            print("""
       *************************************************************************
                                                
                                                
                        Name:\t\t\t\t \(name)               
                                                            
                        HP:\t\t\t\t \(fullHp)                    
                        MP:\t\t\t\t \(fullMp)            
                        Stärke:\t\t\t \(str)                      
                        Verteidigung:\t\t \(def)     
                        Intelligenz:\t\t \(int)       
                        Geschicklichkeit:\t \(dex)    
                        Waffentyp 1:\t\t \(weapontype1.rawValue)     
                        Waffentxp 2:\t\t \(weapontype2.rawValue)               
                                                                    
                                                                
       *************************************************************************
       """)
        }
        
    
    
}
let kirito: Warrior = Warrior(name: "Kirito", str: 10, def: 10, int: 2, dex: 3)
