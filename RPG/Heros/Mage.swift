class Mage: Hero {
    let weapontype1: WeaponType = .wand
    let weapontype2: WeaponType = .magicBraclet
    
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
let rias: Mage = Mage(name: "Rias", str: 2, def: 4, int: 15, dex: 4)

