class Ranger: Hero {
    let weapontype1: WeaponType = .bow
    let weapontype2: WeaponType = .sword
    
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
let aragorn: Ranger = Ranger(name: "Aragorn", str: 5, def: 5, int: 5, dex: 10)

