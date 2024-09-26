class Mage: Hero {
    
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
let rias: Mage = Mage(name: "Rias", str: 2, def: 4, int: 15, dex: 4, allowedWeaponTypes: [.wand, .magicBraclet])

