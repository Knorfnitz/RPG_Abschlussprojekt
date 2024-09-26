class Ranger: Hero {
    
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
let aragorn: Ranger = Ranger(name: "Aragorn", str: 5, def: 5, int: 5, dex: 10, allowedWeaponTypes: [.bow, .sword])

