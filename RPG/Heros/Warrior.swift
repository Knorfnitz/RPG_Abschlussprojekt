class Warrior: Hero {
    
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
let kirito: Warrior = Warrior(name: "Kirito", str: 10, def: 10, int: 2, dex: 3, allowedWeaponTypes: [.sword, .swordAndShild])
