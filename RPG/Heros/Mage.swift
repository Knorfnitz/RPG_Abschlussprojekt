import Foundation

class Mage: Hero, CanUseSpecialAttack, CanHaveCritDamage {
   
    
    
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
    
    func calculateCritDamage() -> Double {
        let critChance:Int = Int.random(in: 0...10)
        if critChance <= 1 {
            return 1.5
        }
        return 1
    }
    
    func useSpecialAttack(enemy: Enemy, critRate: Double) -> Bool {
        
        let attackName1:String = "Eis Speer"
        let attackName2:String = "Höllenflamme"
        let attackName3:String = "Raigeki"
        let attackName4:String = "Flare"
        
        //Schadenberechnungen:
        
        let damageAttack1: Int = int * 2
        let damageAttack2: Int = (int + dex) * 2
        let damageAttack3: Int = (int + dex) * 3
        let damageAttack4: Int = (int + dex) * 5
        
        //MP kosten:
        
        let mpCosts1: Int = 10
        let mpCosts2: Int = 15
        let mpCosts3: Int = 25
        let mpCosts4: Int = 50
        
        print("Spezialattacken:\n")
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
    
    func useSpecialAttackForTerminal(enemy: Enemy, critRate: Double, target: Int) -> Bool {
        let specialTopic = "Spezialattacken von \(name)"
        var attackStringArray: [String] = []
        
        let attackName1:String = "Eis Speer"
        let attackName2:String = "Höllenflamme"
        let attackName3:String = "Raigeki"
        let attackName4:String = "Flare"
        
        //Schadenberechnungen:
        
        let damageAttack1: Int = int * 2
        let damageAttack2: Int = (int + dex) * 2
        let damageAttack3: Int = (int + dex) * 3
        let damageAttack4: Int = (int + dex) * 5
        
        //MP kosten:
        
        let mpCosts1: Int = 10
        let mpCosts2: Int = 15
        let mpCosts3: Int = 25
        let mpCosts4: Int = 50
        
       
        attackStringArray.append("[1] \(attackName1) MP: \(mpCosts1)   Kraft: \(damageAttack1)")
        if lvl >= 5 {
            attackStringArray.append("[2] \(attackName2) MP: \(mpCosts2)   Kraft: \(damageAttack2)")
        }
        if lvl >= 15 {
            attackStringArray.append("[3] \(attackName3) MP: \(mpCosts3)   Kraft: \(damageAttack3)")
        }
        if lvl >= 30 {
            attackStringArray.append("[4] \(attackName4) MP: \(mpCosts4)   Kraft: \(damageAttack4)")
        }
        attackStringArray.append(voidString)
        attackStringArray.append("[9] Zurück")
        attackStringArray.append(voidString)
        attackStringArray.append("Welche Attacke möchtest du ausführen?")
        
        generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
        
        let choice: Int = readNumber()
        
        if choice == 1 {
            
            if mp < mpCosts1 {
                
                attackStringArray = []
                attackStringArray.append(voidString)
                attackStringArray.append("Nicht genug MP!")
                attackStringArray.append(voidString)
                
                generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                
                sleep(2)
                
                return false
                
            }else{
                
                mp -= mpCosts1
                var calculateEndDamage = Int(Double(damageAttack1 - enemy.defense) * critRate)
                if calculateEndDamage <= 0 {
                    
                    attackStringArray = []
                    attackStringArray.append(voidString)
                    attackStringArray.append(voidString)
                    attackStringArray.append("Der Gegner ist zu stark, du machst keinen Damage!")
                    
                    calculateEndDamage = 0
                }else{
                    // enemy.hp -= (damageAttack1 - enemy.defense)
                    
                    attackStringArray = []
                    attackStringArray.append(voidString)
                    attackStringArray.append(voidString)
                    attackStringArray.append("\(name) benutzt \(attackName1) und verursacht")
                    attackStringArray.append("\(calculateEndDamage) Schaden an \(enemy.name)")
                    attackStringArray.append(checkEnemyHealth(enemy: enemy, target: target))
                    
                    if critRate > 1{
                        attackStringArray.append(voidString)
                        attackStringArray.append("Der Angriff war kritsch!")
                        
                    }
                }
                enemy.hp -= calculateEndDamage
                attackStringArray.append(voidString)
                attackStringArray.append(checkEnemyHealth(enemy: enemy, target: target))
                attackStringArray.append(voidString)
                generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                sleep(3)
                
                return true
            }
            
        }else if choice == 2 && lvl >= 5{
            
            if mp < mpCosts1 {
                attackStringArray = []
                attackStringArray.append(voidString)
                attackStringArray.append("Nicht genug MP!")
                attackStringArray.append(voidString)
                
                generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                
                sleep(2)
                
                return false
                
            }else{
                
                mp -= mpCosts2
                var calculateEndDamage = Int(Double(damageAttack2 - enemy.defense) * critRate)
                if calculateEndDamage <= 0 {
                    attackStringArray = []
                    attackStringArray.append(voidString)
                    attackStringArray.append(voidString)
                    attackStringArray.append("Der Gegner ist zu stark, du machst keinen Damage!")
                    
                    generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                    sleep(3)
                    calculateEndDamage = 0
                    
                }else{
                    //enemy.hp -= (damageAttack2 - enemy.defense)
                    attackStringArray = []
                    attackStringArray.append(voidString)
                    attackStringArray.append(voidString)
                    attackStringArray.append("\(name) benutzt \(attackName1) und verursacht")
                    attackStringArray.append("\(calculateEndDamage) Schaden an \(enemy.name)")
                    attackStringArray.append(checkEnemyHealth(enemy: enemy, target: target))
                    
                    if critRate > 1{
                        attackStringArray.append(voidString)
                        attackStringArray.append("Der Angriff war kritsch!")
                    }
                    
                }
                enemy.hp -= calculateEndDamage
                attackStringArray.append(voidString)
                attackStringArray.append(checkEnemyHealth(enemy: enemy, target: target))
                
                generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                sleep(3)
                
                return true
            }
            
        }else if choice == 3 && lvl >= 15{
            
            if mp < mpCosts3 {
                attackStringArray = []
                attackStringArray.append(voidString)
                attackStringArray.append("Nicht genug MP!")
                attackStringArray.append(voidString)
                
                generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                sleep(2)
                return false
                
            }else{
                mp -= mpCosts3
                var calculateEndDamage = Int(Double(damageAttack3 - enemy.defense) * critRate)
                if calculateEndDamage <= 0 {
                    print("Der Gegner ist zu stark, du machst keinen Damage!\n")
                    attackStringArray = []
                    attackStringArray.append(voidString)
                    attackStringArray.append(voidString)
                    attackStringArray.append("Der Gegner ist zu stark, du machst keinen Damage!")
                    
                    generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                    sleep(3)
                    calculateEndDamage = 0
                }else{
                    //enemy.hp -= (damageAttack3 - enemy.defense)
                    attackStringArray = []
                    attackStringArray.append(voidString)
                    attackStringArray.append(voidString)
                    attackStringArray.append("\(name) benutzt \(attackName1) und verursacht")
                    attackStringArray.append("\(calculateEndDamage) Schaden an \(enemy.name)")
                    attackStringArray.append(checkEnemyHealth(enemy: enemy, target: target))
                    if critRate > 1{
                        attackStringArray.append(voidString)
                        attackStringArray.append("Der Angriff war kritsch!")
                    }
                    
                }
                enemy.hp -= calculateEndDamage
                attackStringArray.append(voidString)
                attackStringArray.append(checkEnemyHealth(enemy: enemy, target: target))
                generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                sleep(3)
                return true
            }
            
        }else if choice == 4 && lvl >= 30{
            if mp < mpCosts4 {
                attackStringArray = []
                attackStringArray.append(voidString)
                attackStringArray.append("Nicht genug MP!")
                attackStringArray.append(voidString)
                
                generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                sleep(2)
                return false
                
            }else{
                mp -= mpCosts4
                var calculateEndDamage = Int(Double(damageAttack4 - enemy.defense) * critRate)
                if calculateEndDamage <= 0 {
                    attackStringArray = []
                    attackStringArray.append(voidString)
                    attackStringArray.append(voidString)
                    attackStringArray.append("Der Gegner ist zu stark, du machst keinen Damage!")
                    
                    generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                    calculateEndDamage = 0
                }else{
                    // enemy.hp -= (damageAttack4 - enemy.defense)
                    attackStringArray = []
                    attackStringArray.append(voidString)
                    attackStringArray.append(voidString)
                    attackStringArray.append("\(name) benutzt \(attackName1) und verursacht")
                    attackStringArray.append("\(calculateEndDamage) Schaden an \(enemy.name)")
                    
                    attackStringArray.append(checkEnemyHealth(enemy: enemy, target: target))
                    if critRate > 1{
                        attackStringArray.append(voidString)
                        attackStringArray.append("Der Angriff war kritsch!")
                    }
                    
                }
                enemy.hp -= calculateEndDamage
                attackStringArray.append(voidString)
                attackStringArray.append(checkEnemyHealth(enemy: enemy, target: target))
                generateTerminalWindow(topic: specialTopic, printArray: attackStringArray, in: terminalWidth)
                sleep(3)
                return true
            }
        }else if choice == 9{
            
            return false
        }else{
            print("Falsche Eingabe!")
            sleep(2)
            _ = useSpecialAttackForTerminal(enemy: enemy, critRate: critRate, target: target)
        }
        
        return true
    }
    
}
let rias: Mage = Mage(name: "Rias", str: 2, def: 4, int: 15, dex: 4, allowedWeaponTypes: [.wand, .magicBraclet])

