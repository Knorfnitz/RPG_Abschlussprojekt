import Foundation

var maxLvl: Int = 1

var fightingHeros: [Hero] = Array(heroTeam.prefix(3))

var enemyTeam: [Enemy] = []
var fightingHerosForPrint: [String] = []
/*{
    return fightingHeros.enumerated().map { (index, hero) in
        return "\(index + 1). \(hero.heroForPrint)"
    }
}*/
var enemyTeamForPrint: [String] = []

func generateNewFightingHerosForPrint(){
    fightingHerosForPrint = []
    for (i, hero) in fightingHeros.enumerated(){
        let newString: String = "[\(i+1)] \(hero.heroForPrint)"
        fightingHerosForPrint.append(newString)
    }
}

func generateEnemiesForPrint(){
    enemyTeamForPrint = []
    var enemyEmoji: String = ""
    for (i, enemy) in enemyTeam.enumerated(){
        switch enemy.rare{
         case ..<2:
         enemyEmoji = "[\(i+1)] 👻"
         case 2..<3:
         enemyEmoji = "[\(i+1)] 👿"
         case 3..<4:
         enemyEmoji = "[\(i+1)] 👺"
         case 4..<10:
         enemyEmoji = "[\(i+1)] 💀"
         case 10:
         enemyEmoji = "[\(i+1)] 😼"
         default :
         enemyEmoji = "[\(i+1)] ❓"
         
         }
        let newString: String = "\(enemyEmoji) \(enemy.enemyForPrint) "
        enemyTeamForPrint.append(newString)
    }
}
func startLevelForTerminal(){
    // fightingHeros = Array(heroTeam.prefix(3))
    showLvlForTerminal(fightingHeros)
    
    let selectedLevel:Int = selectLevel()
    
    openGate()
    
    enemyTeam = generateEnemies(selectedLevel)
    generateEnemiesForPrint()
    
    _ = lvlupEnemies(enemyTeam, selectedLevel)
    
    let battleTopic: String = "Kampf auf Ebene \(selectedLevel)"
    
    //var enemiesNames: [String] = []
    //var heroNames: [String] = []
    
    //for (i, enemy) in enemyTeam.enumerated(){
        //var enemyEmoji: String = ""
        /*switch enemy.rare{
         case ..<2:
         enemyEmoji = "[\(i+1)] 👻"
         case 2..<3:
         enemyEmoji = "[\(i+1)] 👿"
         case 3..<4:
         enemyEmoji = "[\(i+1)] 👺"
         case 4..<10:
         enemyEmoji = "[\(i+1)] 💀"
         case 10:
         enemyEmoji = "[\(i+1)] 😼"
         default :
         enemyEmoji = "[\(i+1)] ❓"
         
         }
         enemiesNames.append("\(enemyEmoji) \(enemy.name)")
         }*/
        
        /* for (i, hero) in fightingHeros.enumerated(){
         heroNames.append("[\(i+1)] \(hero.name)  HP: \(hero.hp)/\(hero.fullHp)  MP: \(hero.mp)/\(hero.fullMp)")
         }*/
        
        
        var fight: Bool = true
        while fight{
            
            fightingHeros = Array(heroTeam.prefix(3))
            
            for hero in fightingHeros{
                
                if hero.hp > 0{
                    if areAllEnemiesDead(enemyTeam){
                        //Gewonnen
                        let winTopic: String = "Sieg"
                        var winStringArray: [String] = []
                        let getLootList: [String] = generateLootForTerminal(enemies: enemyTeam, lvl: selectedLevel)
                        let lootSouls:Int = generateLootsouls(enemies: enemyTeam)
                        souls += lootSouls
                        winStringArray.append("Du hast alle Gegner besiegt und dafür \(lootSouls) Seelen erhalten!")
                        winStringArray.append(voidString)
                        winStringArray.append(contentsOf: getLootList)
                        winStringArray.append(voidString)
                        
                        if selectedLevel == maxLvl{
                            icreaseMaxLevel()
                            winStringArray.append("Du kannst nun Ebene \(maxLvl) betreten")
                            winStringArray.append(voidString)
                        }
                        winStringArray.append(enterString)
                        
                        generateTerminalWindowWithSoulAndCenterd(topic: winTopic, printArray: winStringArray, in: terminalWidth)
                        _ = readLine()
                        
                        fight = false
                        
                        break
                        
                    }else{
                        //Held aktion
                        showEnemiesAndWaitForHeroActionForTerminal(hero: hero, topic: battleTopic)
                        
                        
                    }
                    
                }else{
                    if areAllHerosDead(heroTeam){
                        let looseTopic: String = "Verloren"
                        restartLevel(heros: heroTeam)
                        let looseStringArray: [String] = [
                            voidString,
                            voidString,
                            "Alle Helden sind kampfunfähig",
                            voidString,
                            "Ihr habt alle Seelen verloren",
                            voidString,
                            "Ihr wacht im Lager auf...",
                            voidString,
                            enterString,
                        ]
                        generateTerminalWindowWithSoulAndCenterd(topic: looseTopic, printArray: looseStringArray, in: terminalWidth)
                        _ = readLine()
                        
                        fight = false
                        break
                    }
                }
            }
            if fight {
                enemiesActionForTerminal(enemies: enemyTeam, heros: heroTeam)
                
                
            }
        }
    }


func showLvl(){
    
    printLine()
    print("Wähle eine Ebene:\nDeine maximale Ebene ist: \(maxLvl)")
    printRows(rows: 10)
    printLine()
    
}
func showLvlForTerminal(_ fightingHeros: [Hero]){
    
    let showLvlForTerminalTopic: String = "Dungeon"
    var showLvlForTerminalStringArray: [String] = [
        voidString,
        voidString,
        voidString,
        "Wähle eine Ebene:",
        voidString,
        "Deine maximale Ebene ist: \(maxLvl)"
    ]
    showLvlForTerminalStringArray.append(voidString)
    showLvlForTerminalStringArray.append(voidString)
    showLvlForTerminalStringArray.append(voidString)
    for (i, hero) in fightingHeros.enumerated(){
        showLvlForTerminalStringArray.append("[\(i+1)] \(hero.name) Lvl: \(hero.lvl)  HP: \(hero.hp)/\(hero.fullHp)  MP: \(hero.mp)/\(hero.fullMp)")
        showLvlForTerminalStringArray.append(voidString)
    }
    
    generateTerminalWindowWithSouls(topic: showLvlForTerminalTopic, printArray: showLvlForTerminalStringArray, in: terminalWidth)
    
}


func selectLevel()-> Int{
    while true{
        
        let selectLevel = readLine()!
        if selectLevel.isNumber{
            let selectedLevel: Int = Int(selectLevel)!
            if selectedLevel <= maxLvl && selectedLevel > 0{
                return selectedLevel
            }else{
                print("das level ist noch nicht verfügbar")
            }
        }
    }
}

func selectLevelForTerminal()-> Int{
    while true{
        
        let selectLevel = readLine()!
        if selectLevel.isNumber{
            let selectedLevel: Int = Int(selectLevel)!
            if selectedLevel <= maxLvl && selectedLevel > 0{
                return selectedLevel
            }else{
                let selectLevelArray: [String] = [
                    voidString,
                    voidString,
                    voidString,
                    "Diese Ebene ist noch nicht verfügbar",
                    voidString,
                    "Deine maximale Ebene ist: \(maxLvl)",
                    voidString,
                    voidString,
                    enterString
                ]
                generateTerminalWindowWithSoulAndCenterd(topic: "Ebene nicht verfügbar!", printArray: selectLevelArray, in: terminalWidth)
                
            }
        }
    }
}


func startLevel(){
    
    fightingHeros = Array(heroTeam.prefix(3))
    showLvl()
    let selectedLevel:Int = selectLevel()
    let enemyTeam = generateEnemies(selectedLevel)
    _ = lvlupEnemies(enemyTeam, selectedLevel)
    var fight: Bool = true
    while fight{
        for hero in fightingHeros{
            if hero.hp > 0{
                showEnemiesAndWaitForHeroAction(hero: hero, enemies: enemyTeam)
                if areAllEnemiesDead(enemyTeam){
                    print("Du hast alle Gegner besiegt!")
                    let lootSouls:Int = generateLootsouls(enemies: enemyTeam)
                    print("Du hast \(lootSouls) Seelen erhalten")
                    printLine()
                    addSouls(lootSouls)
                    generateLoot(enemies: enemyTeam)
                    print("Weiter mit Enter")
                    _ = readLine()
                    if selectedLevel == maxLvl{
                        icreaseMaxLevel()
                        print("Du kannst nun Ebene \(maxLvl) betreten\n")
                        print("Weiter mit Enter")
                        _ = readLine()
                    }
                    fight = false
                    
                }
            }
        }
        if fight {
            enemiesAction(enemies: enemyTeam, heros: heroTeam)
            
            if areAllHerosDead(heroTeam){
                print("Du hast verloren")
                restartLevel(heros: heroTeam)
                fight = false
            }
        }
    }
}


func generateEnemies(_ level: Int)-> [Enemy]{
    var generatedEnemyTeam: [Enemy] = []
    let enemiesCount:Int = Int.random(in: 1...3)
    let fairnessIndex = if maxLvl < 5 && enemiesCount > 1 { 1 } else { 0 }
    for _ in 1...enemiesCount - fairnessIndex {
       
        generatedEnemyTeam.append(availableEnemies[generateEnemyIndexFromRare(enemies: availableEnemies)])
    }
    return generatedEnemyTeam
}


func generateEnemyIndexFromRare(enemies: [Enemy]) -> Int {
    let rarenessArray = enemies.map { 1.0 / Double($0.rare) } // Kehrwert!
    let totalRarenessValue = rarenessArray.reduce(0, +)
    let randomValue: Double = Double.random(in: 0...totalRarenessValue)
    var rareness: Double = 0
    
    for (index, rarenessArray) in rarenessArray.enumerated() {
        rareness += rarenessArray
        if randomValue < rareness {
            return index
        }
    }
    return 0
}

func areAllEnemiesDead(_ enemyTeam: [Enemy])-> Bool{
    for enemy in enemyTeam{
        if enemy.hp > 0{
            return false
        }
    }
    return true
}

func areAllHerosDead(_ heroTeam: [Hero])-> Bool{
    for hero in heroTeam{
        if hero.hp > 0{
            return false
        }
    }
    return true
}


func showEnemiesAndWaitForHeroAction(hero: Hero, enemies: [Enemy]){
    printLine()
    print("Gegner:")
    for (i, enemy) in enemies.enumerated(){
        print("\(i+1): \(enemy.name) (Level: \(enemy.lvl))")
    }
    if !areAllEnemiesDead(enemies){
        printRows(rows: 3)
        print("Was soll \(hero.name) tun?")
        print("1. Standardangriff")
        print("2. Spezialangriff")
        print("3. Beutel")
        printRows(rows: 1)
        printLine()
        
        var isHeroNotFinish:Bool = false
        
        let heroAction = readNumber()
        
        var critRate: Double = 1.0
        
        if hero is CanHaveCritDamage{
            let canHaveCritDamage = hero as! CanHaveCritDamage
            critRate = canHaveCritDamage.calculateCritDamage()
        }
        
        switch heroAction{
        case 1:
            
            let target = chooseEnemy(enemies: enemies)
            hero.basicAttack(target, critRate)
            
            break
        case 2:
            if !(hero is CanUseSpecialAttack){
                print("\(hero.name) kann noch keine Spezialattacke")
                showEnemiesAndWaitForHeroAction(hero: hero, enemies: enemies)
            }else{
                let canUseSpecialAttack = hero as! CanUseSpecialAttack
                let done:Bool = canUseSpecialAttack.useSpecialAttack(enemy: chooseEnemy(enemies: enemies), critRate: critRate)
                if !done{
                    showEnemiesAndWaitForHeroAction(hero: hero, enemies: enemies)
                }
            }
            break
        case 3:
            isHeroNotFinish = showBag(hero: hero)
            if isHeroNotFinish{
                showEnemiesAndWaitForHeroAction(hero: hero, enemies: enemies)
            }
        default:
            print("Falsche Eingabe")
            showEnemiesAndWaitForHeroAction(hero: hero, enemies: enemies)
        }
    }
}


func showEnemiesAndWaitForHeroActionForTerminal(hero: Hero, topic: String){
    //var newEnemyNames: [String] = enemyNames
    
    var battleMassages: [String] = []
        var isHeroNotFinish:Bool = true
        var critRate: Double = 1.0
    generateNewFightingHerosForPrint()
    //var aktiveHeroStringArray: [String] = herosNames
    for i in 0..<fightingHerosForPrint.count{
        if !fightingHerosForPrint[i].contains(">>") || !fightingHerosForPrint[i].contains("   "){
            if fightingHerosForPrint[i].contains(hero.name){
                fightingHerosForPrint[i] = ">> " + fightingHerosForPrint[i]
            }else{
                fightingHerosForPrint[i] = "   " + fightingHerosForPrint[i]
            }
        }
    }
    battleMassages.append("Was soll \(hero.name) machen?")
    
    
    battleScreen(topic: topic, actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
    
        
        var heroAction = readNumber()
        
        if hero is CanHaveCritDamage{
            let canHaveCritDamage = hero as! CanHaveCritDamage
            critRate = canHaveCritDamage.calculateCritDamage()
        }
        
    while isHeroNotFinish{
        
        switch heroAction{
        case 1:
            
            battleMassages = []
            battleMassages.append("Welcher Gegner soll \(hero.name) angreifen?")
            
            //newEnemyNames = checkEnemieStatus(enemies: enemyTeam, enemieNames: enemyTeamForPrint)
            
            battleScreen(topic: topic,actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
          
            let (target, targetIndex, message) = chooseEnemyForTerminal(enemies: enemyTeam)
            
            if targetIndex == 99 {
                
                battleMassages = []
                battleMassages.append(message)
               // battleMassages.append("Bitte gib einen gültiges Ziel ein")
                battleScreen(topic: topic,actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
                sleep(2)
                
                isHeroNotFinish = true
                
            }else{
                
                if message != ""{
                    battleMassages = []
                    battleMassages.append(message)
                    battleScreen(topic: topic,actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
                }
                battleMassages = []
                battleMassages.append(message)
                
                battleMassages = []
                battleMassages.append(contentsOf: hero.basicAttackForTerminal(target, critRate, target: targetIndex))
                
                //newEnemyNames = checkEnemieStatus(enemies: enemies, enemieNames: enemyNames) //enemyNames?
                
                battleScreen(topic: topic,actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
                sleep(3)
                
                isHeroNotFinish = false
            }
            case 2:
            
            if !(hero is CanUseSpecialAttack){
                battleMassages = []
                battleMassages.append("\(hero.name) kann noch keine Spezialattacke")
                print("\(hero.name) kann noch keine Spezialattacke")
               // newEnemyNames = checkEnemieStatus(enemies: enemies, enemieNames: enemyNames)
                battleScreen(topic: topic,actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
                sleep(2)
                //newEnemyNames = checkEnemieStatus(enemies: enemies, enemieNames: enemyNames)
                showEnemiesAndWaitForHeroActionForTerminal(hero: hero, topic: topic)
                isHeroNotFinish = false
                
            }else{
                let canUseSpecialAttack = hero as! CanUseSpecialAttack
                battleMassages = []
                battleMassages.append("Welchen Gegner soll \(hero.name) angreifen?")
                
                battleScreen(topic: topic, actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
                
                let (target, targetIndex, message) = chooseEnemyForTerminal(enemies: enemyTeam)
                
                if targetIndex == 99{
                    
                    battleMassages = []
                    battleMassages.append(message)
                    
                    battleScreen(topic: topic, actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
                    sleep(2)
                    
                    break
                }else{
                    
                    if message != ""{
                        battleMassages = []
                        battleMassages.append(message)
                        
                        battleScreen(topic: topic,actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
                        sleep(3)
                        heroAction = 2
                    }else{
                        
                        let (done, notEnoughMp) = canUseSpecialAttack.useSpecialAttackForTerminal(enemy: target, critRate: critRate, target: targetIndex)
                        
                        if !done || notEnoughMp{
                            // newEnemyNames = checkEnemieStatus(enemies: enemies, enemieNames: enemyNames)
                            showEnemiesAndWaitForHeroActionForTerminal(hero: hero, topic: topic)
                            isHeroNotFinish = true
                        }else{
                            isHeroNotFinish = false
                        }
                    }
                }
            }
           
        case 3:
            
            let useItem: Bool = showBagForTerminal(hero: hero, heroNames: fightingHerosForPrint)
            
            if useItem{
                isHeroNotFinish = !useItem
            }else{
                  battleScreen(topic: topic,actionMessage: battleMassages, enemies: enemyTeamForPrint, heros: fightingHerosForPrint, in: terminalWidth)
                  
                  heroAction = readNumber()
            }
        default:

            showEnemiesAndWaitForHeroActionForTerminal(hero: hero, topic: topic)
        }
    }
 
    }



func chooseEnemy (enemies: [Enemy]) -> Enemy{
    if enemies.count > 1{
        print("Welchen Gegner möchtest du angreifen?")
        let input: Int = readNumber()
        if input <= enemies.count{
            return enemies[input - 1]
        }else{
            print("Gegner nicht gefunden, es wird der erste Gegner angegriffen.")
            return enemies[0]
        }
    }else{
        return enemies[0]
    }
}

func chooseEnemyForTerminal (enemies: [Enemy]) -> (Enemy, Int, String){
    var message: String = ""
    if enemies.count >= 1{
        let input: Int = readNumber()
        
        if input <= enemies.count && input > 0{
            if enemies[input-1].hp <= 0{
                message = "\(enemies[input-1].name) ist bereits besiegt"
                return (enemies[input-1], 99, message)
            }else{
                return (enemies[input-1], input-1, message)
            }
                
        }else{
            message = "Gegner nicht gefunden"
            return (enemies[0], 99, message)
            
        }
    }else{
        return chooseEnemyForTerminal(enemies: enemies)
    }
}

func enemiesAction(enemies: [Enemy], heros: [Hero]){
    for enemy in enemies{
        if enemy.hp > 0{
            
            let aliveHeros:[Hero] = heros.filter{$0.hp > 0}
            let randomHero: Int = Int.random(in: 0...aliveHeros.count - 1)
            attackHero(enemy: enemy, hero: heros[randomHero])
        }
    }
}
func enemiesActionForTerminal(enemies: [Enemy], heros: [Hero]){
    for enemy in enemies{
        if enemy.hp > 0{
            
            let aliveHeros:[Hero] = heros.filter{$0.hp > 0}
            let randomHero: Int = Int.random(in: 0...aliveHeros.count - 1)
            attackHeroForTerminal(enemy: enemy, hero: heros[randomHero])
        }
    }
}


func attackHero(enemy: Enemy, hero: Hero){

    print("\(enemy.name) greift \(hero.name) mit \(enemy.damage) an")
    hero.hp -= enemy.damage
    }

func attackHeroForTerminal(enemy: Enemy, hero: Hero){
    let attackarray: [String] = [
        voidString,
        voidString,
        voidString,
        "\(enemy.name) greift \(hero.name) mit \(enemy.damage) an"
    ]
    generateTerminalWindow(topic: "\(enemy.name) greift an", printArray: attackarray, in: terminalWidth)

  sleep(3)
    hero.hp -= enemy.damage
   
    }

func restartLevel(heros: [Hero]){
    loseAllSouls()
    for hero in heros{
        hero.hp = hero.fullHp
        hero.mp = hero.fullMp
        
    }
}



func icreaseMaxLevel(){
    maxLvl += 1
}

func calculateHealingCost(){
    if heroTeam.count <= 3 && heroTeam.allSatisfy({ $0.lvl < 5}){
        healingCost = 0
        }else{
            let herosLevelArray = heroTeam.map { $0.lvl }
            let comulateHerosLevel = herosLevelArray.reduce(0, +)
            healingCost = comulateHerosLevel * 20
        }
    
}

func healGroup(){
    if souls >= healingCost{
        for hero in heroTeam{
            hero.hp += hero.fullHp
            hero.mp += hero.fullMp
            
            souls -= healingCost
            
            print("Deine Helden wurden geheilt!")
        }
    }else{
            print("Deine Seelen reichen nicht aus, du kannst nicht heilen!")
        }
    _ = read
    }

func healGroupForTerminal(){
    var healGroupForTerminalStringArray: [String] = []
    let healGroupForTerminalTopic: String = "Heilung"
    
    if souls >= healingCost{
        souls -= healingCost
        healGroupForTerminalStringArray.append(voidString)
        healGroupForTerminalStringArray.append(voidString)
        healGroupForTerminalStringArray.append(voidString)
        healGroupForTerminalStringArray.append("Deine Helden wurden geheilt!")
        
        generateTerminalWindowWithSouls(topic: healGroupForTerminalTopic, printArray: healGroupForTerminalStringArray, in: terminalWidth)
        _ = readLine()
        
        for hero in heroTeam{
            hero.hp += hero.fullHp
            hero.mp += hero.fullMp
            
        }
    }else{
        healGroupForTerminalStringArray.append(voidString)
        healGroupForTerminalStringArray.append(voidString)
        healGroupForTerminalStringArray.append(voidString)
        healGroupForTerminalStringArray.append("Deine Seelen reichen nicht aus, du kannst nicht heilen!")
        
        generateTerminalWindowWithSouls(topic: healGroupForTerminalTopic, printArray: healGroupForTerminalStringArray, in: terminalWidth)
        _ = readLine()
        }
    
    }

func lvlupEnemies(_ enemyTeam: [Enemy], _ selectedLevel: Int) -> [Enemy] {
    
    var leveledEnemyTeam: [Enemy] = []
    for enemy in enemyTeam{
        enemy.fullHp = Int(Double(selectedLevel * 75) * enemy.monsterIndex)
        enemy.hp = enemy.fullHp
        enemy.damage = Int(Double(selectedLevel * 10 ) * enemy.monsterIndex)
        enemy.defense = Int(Double(selectedLevel * 3 ) * enemy.monsterIndex)
        enemy.souls = Int(Double(selectedLevel * 75) * enemy.monsterIndex)
        enemy.lvl = selectedLevel
        
        leveledEnemyTeam.append(enemy)
    }
    
    
    return leveledEnemyTeam
}


func generateLootsouls(enemies: [Enemy]) -> Int{
    var souls: Int = 0
    
    for enemy in enemies{
        souls += enemy.souls
    }
    
    return souls
}

func generateLoot(enemies: [Enemy]) {
    
    
    for enemy in enemies{
        
        switch maxLvl{
        case 1...5:
            //Für Level 1-5 die drops bestimmen, erst Potions, dann Rüstung, dann Waffen
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 0...9)
                print("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                print("\(enemy.name) hat \(inventory.armors[0].name) gedroppt!")
                inventory.armors[0].amount += 1
            }
            
        case 6...10:
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                print("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                print("\(enemy.name) hat \(inventory.armors[1].name) gedroppt!")
                inventory.armors[1].amount += 1
            }
        case 11...15:
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 1 : 5
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                print("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                print("\(enemy.name) hat \(inventory.armors[2].name) gedroppt!")
                inventory.armors[2].amount += 1
            }
        case 16...20:
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 1 : 5
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                print("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                print("\(enemy.name) hat \(inventory.armors[3].name) gedroppt!")
                inventory.armors[3].amount += 1
            }
        case 21...25:
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 1 : 5
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                print("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                print("\(enemy.name) hat \(inventory.armors[4].name) gedroppt!")
                inventory.armors[4].amount += 1
            }
        case 26...30:
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 1 : 5
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 2 : 6
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                print("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                print("\(enemy.name) hat \(inventory.armors[5].name) gedroppt!")
                inventory.armors[5].amount += 1
            }
        case 31...999:
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 1 : 5
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 2 : 6
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate * 0.5 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 3 : 7
                print("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                print("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                print("\(enemy.name) hat \(inventory.armors[5].name) gedroppt!")
                inventory.armors[5].amount += 1
            }
        default:
            print()
        }
        
    }
}

func calculateDropChance(enemy: Enemy) -> Double{
    let dropChance: Double = Double(enemy.rare) * 0.1
    return dropChance
}


func showBag(hero: Hero) -> Bool{
        printLine()
        print("Potions:")
        
        let filteredPotionList = inventory.potions.filter { $0.amount > 0}
        
        for (i, potion) in filteredPotionList.enumerated() {
            print("\(i+1).\t\(potion.name)\tAnzahl: \(potion.amount)\t\t Beschreibung: \(potion.description)")
            print()
        }
        if filteredPotionList.count > 0{
            print("Wähle ein Item (99 für Abbruch)\n")
            let choosePotionNr = readNumber()
            if choosePotionNr <= filteredPotionList.count && choosePotionNr > 0{
                let choosenPotion = filteredPotionList[choosePotionNr-1]
                if choosePotionNr >= filteredPotionList.count  {
                    return true
                }
                usePotionInBattle(choosenPotion)
                
            }
        }else{
            print("Keine Potions vorhanden")
        }
        printLine()
    return true
}

func showBagForTerminal(hero: Hero, heroNames: [String]) -> Bool{
    var finished: Bool = false
    let showBagTopic = "Beutel"
    var showBagStringArray: [String] = []
        
        let filteredPotionList = inventory.potions.filter { $0.amount > 0}
        
        for (i, potion) in filteredPotionList.enumerated() {
            showBagStringArray.append("[\(i+1)] \(potion.name)  Anzahl: \(potion.amount)  - \(potion.description)")
            showBagStringArray.append(voidString)
            
           
        }
        if filteredPotionList.count > 0{
            
            showBagStringArray.append("Wähle ein Item ([99] für Abbruch)")
            
            generateTerminalWindow(topic: showBagTopic, printArray: showBagStringArray, in: terminalWidth)
            
            let choosePotionNr = readNumber()
            
            if choosePotionNr <= filteredPotionList.count && choosePotionNr > 0{
                
                
                let choosenPotion = filteredPotionList[choosePotionNr-1]
                if choosePotionNr >= filteredPotionList.count  {
                }
                finished = usePotionInBattleForTerminal(choosenPotion, heroNames: heroNames)
                
                return finished
                
            }else{
                return finished
            }
        }else{
            showBagStringArray.append(voidString)
            showBagStringArray.append(voidString)
            showBagStringArray.append(voidString)
            showBagStringArray.append("Dein Beutel ist leer")
            generateTerminalWindow(topic: showBagTopic, printArray: showBagStringArray, in: terminalWidth)
            sleep(2)
            
            return finished
            
        }
        

}

func usePotionInBattle(_ potion: Potion){
    print("Bei wem möchtest du \(potion.name) benutzen?\n")
    printFightingTeam()
    let chooseHero = readNumber()
    if chooseHero <= fightingHeros.count{
        if potion.potionType == 1{
            fightingHeros[chooseHero-1].hp += potion.amountOfHeal
            print("\(fightingHeros[chooseHero-1].name)´s HP wurde um \(potion.amountOfHeal) geheilt!")
            potion.amount -= 1
        }else{
            fightingHeros[chooseHero-1].mp += potion.amountOfHeal
            print("\(fightingHeros[chooseHero-1].name)´MP wurde um \(potion.amountOfHeal) regeneriert!")
            potion.amount -= 1
        }
    }
}

func usePotionInBattleForTerminal(_ potion: Potion, heroNames: [String]) -> Bool{
    var usedPotion = false
    let showBagTopic = "\(potion.name)"
    var showBagStringArray: [String] = []
    showBagStringArray.append(voidString)
    showBagStringArray.append("Bei wem möchtest du \(potion.name) benutzen?")
    showBagStringArray.append(voidString)
    showBagStringArray.append(contentsOf:heroNames)
    
    generateTerminalWindow(topic: showBagTopic, printArray: showBagStringArray, in: terminalWidth)
    
    let chooseHero = readNumber()
    if chooseHero <= fightingHeros.count && chooseHero > 0{
        
        if heroNames[chooseHero-1].contains("HP: 0"){
            showBagStringArray = []
            showBagStringArray.append(voidString)
            showBagStringArray.append(voidString)
            showBagStringArray.append(voidString)
            showBagStringArray.append("\(fightingHeros[chooseHero-1].name) ist bereits tot!")
            showBagStringArray.append("Er kann nicht geheilt werden!")
            
            usedPotion = false
        }else{
            
            if potion.potionType == 1{
                fightingHeros[chooseHero-1].hp += potion.amountOfHeal
                print("\(fightingHeros[chooseHero-1].name)´s HP wurde um \(potion.amountOfHeal) geheilt!")
                potion.amount -= 1
                showBagStringArray = []
                showBagStringArray.append(voidString)
                showBagStringArray.append(voidString)
                showBagStringArray.append(voidString)
                showBagStringArray.append("\(fightingHeros[chooseHero-1].name)´s HP wurde um \(potion.amountOfHeal) geheilt!")
                generateTerminalWindow(topic: showBagTopic, printArray: showBagStringArray, in: terminalWidth)
                usedPotion = true
                
            }else{
                fightingHeros[chooseHero-1].mp += potion.amountOfHeal
                showBagStringArray = []
                showBagStringArray.append(voidString)
                showBagStringArray.append(voidString)
                showBagStringArray.append(voidString)
                showBagStringArray.append("\(fightingHeros[chooseHero-1].name)´MP wurde um \(potion.amountOfHeal) regeneriert!")
                print("\(fightingHeros[chooseHero-1].name)´MP wurde um \(potion.amountOfHeal) regeneriert!")
                potion.amount -= 1
                usedPotion = true
                
            }
            return usedPotion
        }
        return usedPotion
    }
    return usedPotion
}

func printFightingTeam(){
    for (i, hero) in fightingHeros.enumerated(){
            
            print("\(i+1).  \(hero.name)\t HP: (\(hero.hp)/\(hero.fullHp))\t MP: (\(hero.mp)/\(hero.fullMp))\t")
            
        }
    }


func generateLootForTerminal(enemies: [Enemy], lvl: Int) -> [String] {
    var loot: [String] = []
    
    for enemy in enemies{
        
        switch lvl{
        case 1...5:
            //Für Level 1-5 die drops bestimmen, erst Potions, dann Rüstung, dann Waffen
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 0...9)
                loot.append("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                loot.append("\(enemy.name) hat \(inventory.armors[0].name) gedroppt!")
                inventory.armors[0].amount += 1
            }
            
        case 6...10:
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                loot.append("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                loot.append("\(enemy.name) hat \(inventory.armors[1].name) gedroppt!")
                inventory.armors[1].amount += 1
            }
        case 11...15:
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 1 : 5
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                loot.append("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                loot.append("\(enemy.name) hat \(inventory.armors[2].name) gedroppt!")
                inventory.armors[2].amount += 1
            }
        case 16...20:
            var dropRate:Double = calculateDropChance(enemy: enemy)
            if dropRate * 2 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 0 : 4
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 1 : 5
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                loot.append("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                loot.append("\(enemy.name) hat \(inventory.armors[3].name) gedroppt!")
                inventory.armors[3].amount += 1
            }
        case 21...25:
            var dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 1 : 5
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                loot.append("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                loot.append("\(enemy.name) hat \(inventory.armors[4].name) gedroppt!")
                inventory.armors[4].amount += 1
            }
        case 26...30:

            var dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 1 : 5
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 2 : 6
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                loot.append("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                loot.append("\(enemy.name) hat \(inventory.armors[5].name) gedroppt!")
                inventory.armors[5].amount += 1
            }
        case 31...999:
            var dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 2 : 6
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate * 0.5 >= Double.random(in: 0...1){
                let whichPotion: Int = Bool.random() ? 3 : 7
                loot.append("\(enemy.name) hat \(inventory.potions[whichPotion].name) gedroppt!")
                inventory.potions[whichPotion].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                let whichWeapon: Int = Int.random(in: 10...19)
                loot.append("\(enemy.name) hat \(inventory.weapons[whichWeapon].name) gedroppt!")
                inventory.weapons[whichWeapon].amount += 1
            }
            dropRate = calculateDropChance(enemy: enemy)
            if dropRate >= Double.random(in: 0...1){
                loot.append("\(enemy.name) hat \(inventory.armors[5].name) gedroppt!")
                inventory.armors[5].amount += 1
            }
        default:
            print()
        }
        
    }
    while loot.count >= 12{
        loot.remove(at: 0)
    }
    
    return loot
}


/*func checkEnemieStatus(enemies: [Enemy], enemieNames: [String]) -> [String] {
    var newEnemieNamesString: [String] = enemieNames
    for i in 0..<enemieNames.count{
        if enemieNames[i].contains(enemies[i].name){
            if enemies[i].hp <= enemies[i].fullHp/2 && enemies[i].hp > (enemies[i].fullHp / 5) && !enemieNames[i].contains("(geschwächt)") {
                newEnemieNamesString[i] = newEnemieNamesString[i] + "(geschwächt)"
            }
            if enemies[i].hp <= (enemies[i].fullHp / 5) && enemies[i].hp > 0 && !enemieNames[i].contains("(taumelt)") {
                newEnemieNamesString[i] = newEnemieNamesString[i] + "(taumelt)"
            }
            if enemies[i].hp <= 0 && !enemieNames[i].contains("XXX") {
                newEnemieNamesString[i] = "XXX" + newEnemieNamesString[i] + "XXX"
            }
        }
    }
    return newEnemieNamesString
}*/
func renerateHeroStatus(herosNames: [String], hero: Hero)->[String]{
    var aktiveHeroStringArray: [String] = herosNames
    for i in 0..<aktiveHeroStringArray.count{
        if !aktiveHeroStringArray[i].contains(">>") || !aktiveHeroStringArray[i].contains("   "){
            if aktiveHeroStringArray[i].contains(hero.name){
                aktiveHeroStringArray[i] = ">> " + aktiveHeroStringArray[i]
            }else{
                aktiveHeroStringArray[i] = "   " + aktiveHeroStringArray[i]
            }
        }
    }
    return aktiveHeroStringArray
}



