class Druid: Hero {
    let weapontype1: WeaponType = .mace
    let weapontype2: WeaponType = .totem
    
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
let radagast: Druid = Druid(name: "Radagast", str: 5, def: 10, int: 7, dex: 3)
