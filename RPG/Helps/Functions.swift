import Foundation

// confirm für charakter wahl
func confirm (_ input: String) -> String{

    if input.isEmpty {
        isEnded = true
        return ""
    }else {
        return "0"
    }
}


func printLine(){
    print("*************************************************************************\n")
}

func printRows(rows: Int){
    for _ in 1...rows {
        print()
    }
}


func readNumber() -> Int {
    while true {
        if let number = readLine(strippingNewline: true), number.isNumber {
            return Int(number)!
        }
        print("Bitte geben Sie eine Zahl ein: ", terminator: "")
    }
}

func readNumberWithCancelIfCR() -> Int {
    while true {
        if let number = readLine(strippingNewline: true), number.isNumber {
            return Int(number)!
        }
    }
}

func showcampMenu()-> String{
    var menue: String?
    
    calculateHealingCost()
    printLine()
 //   printRows(rows: 2)
    print("Lager:\n")
    print("1. Team tauschen\n2. Inventar\n3. Heilen (Kosten: \(healingCost) Seelen)\n4. Leveln\n5. Kampf\n6. Shop")
    
    printCurrentTeam(heros: heroTeam)
  //  printRows(rows: 1)
    print("\t\t\t\t\t\t\t\t\t\t\t\tSeelen: \(souls)")
    printLine()
    print("Wähle ein Menuepunkt:")
    print()
    menue = readLine()
    return menue!
}

func showCampMenuForTerminal()-> String{
    var menue: String?
    calculateHealingCost()
    
    var campMenuStringArray: [String] = [
        "[1] Team tauschen",
        "[2] Inventar",
        "[3] Heilen (Kosten: \(healingCost) Seelen)",
        "[4] Levelup",
        "[5] Kampf",
        "[6] Shop",
        voidString,
        voidString,
        "Aktuelles Team:",
        voidString]
    
    let generateHerosStringArray: [String] = CurrentTeamToStringArray(heros: heroTeam)
    
    campMenuStringArray.append(contentsOf: generateHerosStringArray)

    fadeoutWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)
    generateTerminalWindowWithSouls(topic: "Lager", printArray: campMenuStringArray, in: terminalWidth)
    
    menue = readLine()

   
    return menue!
}


func printCurrentTeam(heros: [Hero]){
    print("\naktuelles Team:")
    for (i, heros) in heros.enumerated(){
        print("\(i+1): \(heros.name) Level: \(heros.lvl) HP: \(heros.hp)/\(heros.fullHp) MP: \(heros.mp)/\(heros.fullMp) STR: \(heros.str) DEF: \(heros.def) INT: \(heros.int) DEX:\(heros.dex)")
    }
}

func CurrentTeamToStringArray(heros: [Hero]) -> [String]{
    var currentTeamStringArray: [String] = []
    for (i, heros) in heros.enumerated(){
        currentTeamStringArray.append("\(i+1). \(heros.name) (\(heros.lvl)) HP: \(heros.hp)/\(heros.fullHp) MP: \(heros.mp)/\(heros.fullMp) STR: \(heros.str) DEF: \(heros.def) INT: \(heros.int) DEX:\(heros.dex)")
    }
    return currentTeamStringArray
}


func waitForInput(){
    print("Weiter mit Enter!")
    _ = readLine()
}

func createCheatTeam (){
    heroTeam.append(radagast)
    heroTeam.append(kirito)
    heroTeam.append(rias)
    
    
    availableHerosForBuy.append(shion)
    availableHerosForBuy.append(aragorn)
    availableHerosForBuy.append(milim)
    
    kirito.str = 2500
    kirito.def = 1500
    kirito.int = 500
    kirito.dex = 500
    kirito.fullHp = kirito.str * 3 + kirito.def * 9
    kirito.hp = kirito.fullHp
    kirito.fullMp = Int(Double(kirito.dex) * 0.5 + Double(kirito.int) * 2.5)
    kirito.mp = kirito.fullMp
    
    
    rias.str += 500
    rias.def += 500
    rias.int += 2500
    rias.dex += 1500
    rias.fullHp = rias.str * 3 + rias.def * 9
    rias.hp = rias.fullHp
    rias.fullMp = Int(Double(rias.dex) * 0.5 + Double(rias.int) * 2.5)
    rias.mp = rias.fullMp
    
    
    radagast.str += 2500
    radagast.def += 500
    radagast.int += 500
    radagast.dex += 1500
    radagast.fullHp = radagast.str * 3 + radagast.def * 9
    radagast.hp = radagast.fullHp
    radagast.fullMp = Int(Double(radagast.dex) * 0.5 + Double(radagast.int) * 2.5)
    radagast.mp = radagast.fullMp
    
    kirito.lvl = 99
    rias.lvl = 99
    radagast.lvl = 99
    
    maxLvl = 99
    
    souls = 99999
    
    inventory.potions[3].amount = 99
    inventory.potions[7].amount = 99
    
    //potionList[3].amount = 99
    //potionList[7].amount = 99
    
    let amountOfItems: Int = 10
    
    inventory.armors[4].increaseAmount(amount: amountOfItems)
    inventory.armors[5].increaseAmount(amount: amountOfItems)
    
    inventory.weapons[20].increaseAmount(amount: amountOfItems)
    inventory.weapons[21].increaseAmount(amount: amountOfItems)
    inventory.weapons[22].increaseAmount(amount: amountOfItems)
    inventory.weapons[23].increaseAmount(amount: amountOfItems)
    inventory.weapons[24].increaseAmount(amount: amountOfItems)
    inventory.weapons[25].increaseAmount(amount: amountOfItems)
    inventory.weapons[26].increaseAmount(amount: amountOfItems)
    inventory.weapons[27].increaseAmount(amount: amountOfItems)
    inventory.weapons[28].increaseAmount(amount: amountOfItems)
    inventory.weapons[29].increaseAmount(amount: amountOfItems)
    
    //armorList[5].amount = 10
}




func chooseHeroForLevelUp(heros: [Hero])-> Hero{
    printLine()
    print("Welcher Held möchtest du aufleveln?")
    printLine()
    for (i, hero) in heros.enumerated(){
        print("\(i+1). \(hero.name) Lvl: \(hero.lvl)")
    }
    printLine()
    let choice: Int = readNumber()
    if choice >= 1 || choice <= heros.count{
        let hero = heros[choice - 1]
            return hero
        }
    return heros[0]
    }

func chooseHeroForLevelUpForTerminal(heros: [Hero])-> Hero{
    let topic:String = "Welcher Held möchtest du aufleveln?"
    var array: [String] = []
    
    for (i, hero) in heros.enumerated(){
        array.append("[\(i+1)] \(hero.name) Lvl: \(hero.lvl)")
    }
    generateTerminalWindowWithSouls(topic: topic, printArray: array, in: terminalWidth)
    let choice: Int = readNumber()
    if choice >= 1 || choice <= heros.count{
        let hero = heros[choice - 1]
            return hero
        }
    return heros[0]
    }


func levelUp(hero: Hero){
    let lvlupCost:Int = hero.lvl * 200
    printLine()
    print(hero.name)
    print("Level:  \(hero.lvl)")
    print("   HP:  \(hero.hp)/\(hero.fullHp)")
    print("   MP:  \(hero.mp)\(hero.fullMp)")
    print("    1: Stärke:       \(hero.str)")
    print("    2: Verteidigung: \(hero.def)")
    print("    3: Intelligenz:  \(hero.int)")
    print("    4: Geschick:     \(hero.dex)")
    print()
    print("    5: Abbruch")
    
    print("\nKosten LevelUp: \(lvlupCost) Seelen")
    
    if souls < lvlupCost{
        print("Du hast nicht genug Seelen!")
    }else{
        
        var isLvlupInProgress:Bool = true
        while isLvlupInProgress{
            
            print("\nWelchen Wert möchtest du um 5 erhöhen?\n")
            let input:Int = readNumber()
            switch input{
            case 1:
                hero.str += 5
                print("Stärke erhöht auf \(hero.str) und du wurdest vollständig geheilt")
                souls -= lvlupCost
                hero.fullHp = hero.str * 3 + hero.def * 9
                hero.fullMp = hero.dex * 1 + hero.int * 3
                hero.hp = hero.fullHp
                hero.mp = hero.fullMp
                hero.lvl += 1
                isLvlupInProgress = false
            case 2: hero.def += 5
                print("Verteidigung erhöht auf \(hero.def) und du wurdest vollständig geheilt")
                isLvlupInProgress = false
                souls -= lvlupCost
                hero.fullHp = hero.str * 3 + hero.def * 9
                hero.fullMp = hero.dex * 1 + hero.int * 3
                hero.hp = hero.fullHp
                hero.mp = hero.fullMp
                hero.lvl += 1
            case 3: hero.int += 5
                print("Intelligenz erhöht auf \(hero.int) und du wurdest vollständig geheilt")
                isLvlupInProgress = false
                souls -= lvlupCost
                hero.fullHp = hero.str * 3 + hero.def * 9
                hero.fullMp = hero.dex * 1 + hero.int * 3
                hero.hp = hero.fullHp
                hero.mp = hero.fullMp
                hero.lvl += 1
            case 4: hero.dex += 5
                print("Geschick erhöht auf \(hero.dex) und du wurdest vollständig geheilt")
                isLvlupInProgress = false
                souls -= lvlupCost
                hero.fullHp = hero.str * 3 + hero.def * 9
                hero.fullMp = hero.dex * 1 + hero.int * 3
                hero.hp = hero.fullHp
                hero.mp = hero.fullMp
                hero.lvl += 1
            case 5: isLvlupInProgress = false
            default:
                print("Falsche Eingabe!")
            }
        }
    }
}


func levelUpForTerminal(hero: Hero){
    let lvlupCost:Int = hero.lvl * 200
    var printArrayForLvlUp: [String] = []
    let heroLvlUpStats: [String] = [
        "Level:  \(hero.lvl)",
        "   HP:  \(hero.hp)/\(hero.fullHp)",
        "   MP:  \(hero.mp)/\(hero.fullMp)",
        "  [1]: Stärke:       \(hero.str)",
        "  [2]: Verteidigung: \(hero.def)",
        "  [3]: Intelligenz:  \(hero.int)",
        "  [4]: Geschick:     \(hero.dex)",
        voidString,
        "  [5]: Abbruch",
        voidString,
        "Kosten für LevelUp: \(lvlupCost) Seelen"
    ]
    printArrayForLvlUp.append(contentsOf: heroLvlUpStats)
    
    if souls < lvlupCost{
        printArrayForLvlUp.append(voidString)
        printArrayForLvlUp.append("Du hast nicht genug Seelen!")
        generateTerminalWindowWithSouls(topic: hero.name, printArray: printArrayForLvlUp, in: terminalWidth)
    }else{
        
        var isLvlupInProgress:Bool = true
        while isLvlupInProgress{
            
            printArrayForLvlUp.append(voidString)
            printArrayForLvlUp.append("Welchen Wert möchtest du um 5 erhöhen?!")
            generateTerminalWindowWithSouls(topic: hero.name, printArray: printArrayForLvlUp, in: terminalWidth)
            let input:Int = readNumber()
            switch input{
            case 1:
                hero.str += 5
                souls -= lvlupCost
                hero.fullHp = hero.str * 3 + hero.def * 9
                hero.fullMp = hero.dex * 1 + hero.int * 3
                hero.hp = hero.fullHp
                hero.mp = hero.fullMp
                hero.lvl += 1
                printArrayForLvlUp = []
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append("Stärke wurde auf \(hero.str) erhöht.")
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append("Du wurdest vollständig geheilt")
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(enterString)
                generateTerminalWindowWithSouls(topic: hero.name, printArray: printArrayForLvlUp, in: terminalWidth)
                _ = readLine()
               isLvlupInProgress = false
            case 2:
                hero.def += 5
                souls -= lvlupCost
                hero.fullHp = hero.str * 3 + hero.def * 9
                hero.fullMp = hero.dex * 1 + hero.int * 3
                hero.hp = hero.fullHp
                hero.mp = hero.fullMp
                hero.lvl += 1
                printArrayForLvlUp = []
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append("Stärke wurde auf \(hero.def) erhöht.")
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append("Du wurdest vollständig geheilt")
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(enterString)
                generateTerminalWindowWithSouls(topic: hero.name, printArray: printArrayForLvlUp, in: terminalWidth)
                _ = readLine()
               isLvlupInProgress = false
            case 3:
                hero.int += 5
                souls -= lvlupCost
                hero.fullHp = hero.str * 3 + hero.def * 9
                hero.fullMp = hero.dex * 1 + hero.int * 3
                hero.hp = hero.fullHp
                hero.mp = hero.fullMp
                hero.lvl += 1
                printArrayForLvlUp = []
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append("Stärke wurde auf \(hero.int) erhöht.")
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append("Du wurdest vollständig geheilt")
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(enterString)
                generateTerminalWindowWithSouls(topic: hero.name, printArray: printArrayForLvlUp, in: terminalWidth)
                _ = readLine()
               isLvlupInProgress = false
            case 4:
                hero.dex += 5
                souls -= lvlupCost
                hero.fullHp = hero.str * 3 + hero.def * 9
                hero.fullMp = hero.dex * 1 + hero.int * 3
                hero.hp = hero.fullHp
                hero.mp = hero.fullMp
                hero.lvl += 1
                printArrayForLvlUp = []
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append("Stärke wurde auf \(hero.dex) erhöht.")
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append("Du wurdest vollständig geheilt")
                printArrayForLvlUp.append(voidString)
                printArrayForLvlUp.append(enterString)
                generateTerminalWindowWithSouls(topic: hero.name, printArray: printArrayForLvlUp, in: terminalWidth)
                _ = readLine()
               isLvlupInProgress = false
            case 5:
                isLvlupInProgress = false
                
            default:
                print("Falsche Eingabe!")
                isLvlupInProgress = false
            }
        }
    }
}



func swapHeroTeam(heros: [Hero]) -> [Hero]{
    printLine()
    printCurrentTeam(heros: heros)
    print()
    print("Wer soll vertauscht werden?\n")
    print("Wähle den ersten Helden aus:\n")
    var chooseHero1ToSwap: Int = readNumber()
    print("Wähle den zweiten Helden aus:\n")
    var chooseHero2ToSwap: Int = readNumber()
    
    if chooseHero1ToSwap <= 0 { chooseHero1ToSwap = 1 }

    if chooseHero2ToSwap <= 0 { chooseHero2ToSwap = 1 }
    
    if chooseHero1ToSwap <= heros.count && chooseHero2ToSwap <= heros.count {
        
        var newHerosToOrder: [Hero] = heros
        newHerosToOrder.swapAt(chooseHero1ToSwap - 1, chooseHero2ToSwap - 1)
        
        return newHerosToOrder
        
    }else{
        print("Kann Eingabe nicht verarbeiten.\n")
    }
    
    return heros
    
}

func swapHeroTeamForTerminal(heros: [Hero]) -> [Hero]{
    var swapHeroStringArray: [String] = []
    let generateHerosStringArray: [String] = CurrentTeamToStringArray(heros: heroTeam)
    swapHeroStringArray.append(contentsOf: generateHerosStringArray)
    swapHeroStringArray.append(voidString)
    swapHeroStringArray.append("Wer soll vertauscht werden?")
    swapHeroStringArray.append(voidString)
    swapHeroStringArray.append("Wähle den ersten Helden aus:")
    
    
    generateTerminalWindowWithSouls(topic: "Team tauschen", printArray: swapHeroStringArray, in: terminalWidth)
    
    var chooseHero1ToSwap: Int = readNumber()
 
    
    if chooseHero1ToSwap <= 0 || chooseHero1ToSwap > heros.count  { chooseHero1ToSwap = 1 }

    swapHeroStringArray.append(voidString)
    swapHeroStringArray.append("Mit wem möchtest du \(heros[chooseHero1ToSwap - 1].name) tauschen?")
   
    generateTerminalWindowWithSouls(topic: "Team tauschen", printArray: swapHeroStringArray, in: terminalWidth)
    var chooseHero2ToSwap: Int = readNumber()
    

    if chooseHero2ToSwap <= 0 || chooseHero2ToSwap > heros.count { chooseHero2ToSwap = 1 }
        
        var newHerosToOrder: [Hero] = heros
        newHerosToOrder.swapAt(chooseHero1ToSwap - 1, chooseHero2ToSwap - 1)
    
    swapHeroStringArray = []
    swapHeroStringArray.append("Du hast erfolgreich")
    swapHeroStringArray.append("\(heros[chooseHero1ToSwap - 1].name) mit \(heros[chooseHero2ToSwap - 1].name) getautscht.")
    swapHeroStringArray.append(voidString)
    swapHeroStringArray.append(enterString)
    

    generateTerminalWindowWithSouls(topic: "Team tauschen", printArray: swapHeroStringArray, in: terminalWidth)
   
    
    _ = readLine()
    
        return newHerosToOrder
}
    

