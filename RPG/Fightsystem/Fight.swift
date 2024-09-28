import Foundation

var maxLvl: Int = 1

var fightingHeros: [Hero] = []

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
        showLvlForTerminalStringArray.append("[\(i)] \(hero.name) Lvl: \(hero.lvl)  HP: \(hero.hp)/\(hero.fullHp)  MP: \(hero.mp)/\(hero.fullMp)")
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

func startLevelForTerminal(){
    fightingHeros = Array(heroTeam.prefix(3))
    showLvlForTerminal(fightingHeros)
    
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
    var enemyTeam: [Enemy] = []
    let enemiesCount:Int = Int.random(in: 1...3)
    let fairnessIndex = if maxLvl < 5 && enemiesCount > 1 { 1 } else { 0 }
    for _ in 1...enemiesCount - fairnessIndex {
       
        enemyTeam.append(availableEnemies[generateEnemyIndexFromRare(enemies: availableEnemies)])
    }
    return enemyTeam
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


func showEnemiesAndWaitForHeroActionForTerminal(hero: Hero, enemies: [Enemy]){
    let terminalSize // generate fightWindow
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

func enemiesAction(enemies: [Enemy], heros: [Hero]){
    for enemy in enemies{
        if enemy.hp > 0{
            
            let aliveHeros:[Hero] = heros.filter{$0.hp > 0}
            let randomHero: Int = Int.random(in: 0...aliveHeros.count - 1)
            attackHero(enemy: enemy, hero: heros[randomHero])
        }
    }
}


func attackHero(enemy: Enemy, hero: Hero){

    print("\(enemy.name) greift \(hero.name) mit \(enemy.damage) an")
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
        enemy.fullHp = Int(Double(selectedLevel * 75 * enemy.rare) * enemy.monsterIndex)
        enemy.hp = enemy.fullHp
        enemy.damage = Int(Double(selectedLevel * 8 * enemy.rare) * enemy.monsterIndex)
        enemy.defense = Int(Double(selectedLevel * 1 * enemy.rare) * enemy.monsterIndex)
        enemy.souls = Int(Double(selectedLevel * 70 * enemy.rare) * enemy.monsterIndex)
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

func printFightingTeam(){
    for (i, hero) in fightingHeros.enumerated(){
            
            print("\(i+1).  \(hero.name)\t HP: (\(hero.hp)/\(hero.fullHp))\t MP: (\(hero.mp)/\(hero.fullMp))\t")
            
        }
    }

