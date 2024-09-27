import Foundation
class Healer: Hero, CanUseSpecialAttack, CanHaveCritDamage {
    
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
    
    func useSpecialAttack(enemy: Enemy, critRate: Double) -> Bool {
        
        let attackName1:String = "Heiliger Strahl"
        let attackName2:String = "Licht der Erlösung"
        let attackName3:String = "Engel der Vernichtung"
        let attackName4:String = "Urteil des Himmels"
        
        //Schadenberechnungen:
        
        let damageAttack1: Int = int * 2 * lvl
        let damageAttack2: Int = (int + dex) * 2 * lvl
        let damageAttack3: Int = (int + dex) * 3 * lvl
        let damageAttack4: Int = (int + dex) * 5 * lvl
        
        //MP kosten:
        
        let mpCosts1: Int = 10
        let mpCosts2: Int = 15
        let mpCosts3: Int = 25
        let mpCosts4: Int = 50
        
        print("Sepzialattacken:\n")
        print("1. \(attackName1) MP: \(mpCosts1)   Kraft: \(damageAttack1)")
        if lvl >= 5 {
            print("2. \(attackName2) MP: \(mpCosts2)   Kraft: \(damageAttack2)")
        }
        if lvl >= 15 {
            print("3. \(attackName3) MP: \(mpCosts3)   Kraft: \(damageAttack3)")
        }
        if lvl >= 30 {
            print("4. \(attackName4) MP: \(mpCosts4)   Kraft: \(damageAttack4)")
        }
        print("9. Zurück")
        printRows(rows: 1)
        print("Welche Attacke möchtest du ausführen?")
        let choice: Int = readNumber()
        
        if choice == 1 {
            mp -= mpCosts1
            var calculateEndDamage = Int(Double(damageAttack1 - enemy.defense) * critRate)
            if calculateEndDamage <= 0 {
                print("Der Gegner ist zu stark, du machst keinen Damage!\n")
                calculateEndDamage = 0
            }else{
                enemy.hp -= (damageAttack1 - enemy.defense)
                print("\(name) benutzt \(attackName1) und verursacht \(calculateEndDamage) Schaden an \(enemy.name)")
                if critRate > 1{
                    print("Der Angriff war kritsch!")
                }
            }
            enemy.hp -= calculateEndDamage
            return true
            
        }else if choice == 2 && lvl >= 5{
            mp -= mpCosts2
            var calculateEndDamage = Int(Double(damageAttack2 - enemy.defense) * critRate)
            if calculateEndDamage <= 0 {
                print("Der Gegner ist zu stark, du machst keinen Damage!\n")
                calculateEndDamage = 0
            }else{
                enemy.hp -= (damageAttack2 - enemy.defense)
                print("\(name) benutzt \(attackName2) und verursacht \(calculateEndDamage) Schaden an \(enemy.name)")
                if critRate > 1{
                    print("Der Angriff war kritsch!")
                }
            }
            enemy.hp -= calculateEndDamage
            return true
            
        }else if choice == 3 && lvl >= 5{
            mp -= mpCosts3
            var calculateEndDamage = Int(Double(damageAttack3 - enemy.defense) * critRate)
            if calculateEndDamage <= 0 {
                print("Der Gegner ist zu stark, du machst keinen Damage!\n")
                calculateEndDamage = 0
            }else{
                enemy.hp -= (damageAttack3 - enemy.defense)
                print("\(name) benutzt \(attackName3) und verursacht \(calculateEndDamage) Schaden an \(enemy.name)")
                if critRate > 1{
                    print("Der Angriff war kritsch!")
                }
            }
            enemy.hp -= calculateEndDamage
            return true
            
        }else if choice == 4 && lvl >= 5{
            mp -= mpCosts4
            var calculateEndDamage = Int(Double(damageAttack4 - enemy.defense) * critRate)
            if calculateEndDamage <= 0 {
                print("Der Gegner ist zu stark, du machst keinen Damage!\n")
                calculateEndDamage = 0
            }else{
                enemy.hp -= (damageAttack4 - enemy.defense)
                print("\(name) benutzt \(attackName1) und verursacht \(calculateEndDamage) Schaden an \(enemy.name)")
                if critRate > 1{
                    print("Der Angriff war kritsch!")
                }
            }
            enemy.hp -= calculateEndDamage
            return true
            
        }else if choice == 9{
            return false
        }else{
            print("Falsche Eingabe!")
            sleep(2)
            _ = useSpecialAttack(enemy: enemy, critRate: critRate)
        }
        
        return true
    }
    
    func calculateCritDamage() -> Double {
        let critChance:Int = Int.random(in: 0...10)
        if critChance <= 1 {
            return 1.5
        }
        return 1
    }
    
}
let milim: Healer = Healer(name: "Milim", str: 4, def: 5, int: 10, dex: 6, allowedWeaponTypes: [.wand, .dagger])
