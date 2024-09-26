class Healer: Hero {
    
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
let milim: Healer = Healer(name: "Milim", str: 4, def: 5, int: 10, dex: 6, allowedWeaponTypes: [.wand, .dagger])
