class Druid: Hero {
    
    override init(
        name: String,
        str: Int,
        def: Int,
        int: Int,
        dex: Int,
        allowedWeaponTypes: [WeaponType],
        weapon: Weapon? = nil,
        armor: Armor? = nil
    ) {
        super.init(name: name, str: str, def: def, int: int, dex: dex, allowedWeaponTypes: allowedWeaponTypes, weapon: weapon, armor: armor)
        
    }
    
}
let radagast: Druid = Druid(name: "Radagast", str: 5, def: 10, int: 7, dex: 3, allowedWeaponTypes: [.totem, .mace])
