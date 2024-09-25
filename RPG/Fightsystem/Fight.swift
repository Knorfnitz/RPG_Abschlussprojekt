import Foundation

var maxLvl: Int = 1

func showLvl(){
    
    printLine()
    print("Wähle eine Ebene:\nDeine maximale Ebene ist: \(maxLvl)")
    printRows(rows: 10)
    printLine()
    
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


func startLevel(){
    showLvl()
    let selectedLevel:Int = selectLevel()
    let enemyTeam = generateEnemies(selectedLevel)
    _ = lvlup(enemyTeam, selectedLevel)
    var fight: Bool = true
    while fight{
        for hero in heroTeam{
            if hero.hp > 0{
                showEnemiesAndWaitForHeroAction(hero: hero, enemies: enemyTeam)
                if areAllEnemiesDead(enemyTeam){
                    print("Du hast alle Gegner besiegt!")
                    let lootSouls:Int = generateLootsouls(enemies: enemyTeam)
                    print("Du hast \(lootSouls) Seelen erhalten")
                    addSouls(lootSouls)
                    generateLoot(enemies: enemyTeam)
                    if selectedLevel == maxLvl{
                        icreaseMaxLevel()
                        print("Du kannst nun Ebene \(maxLvl) betreten")
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
        
        
        let heroAction = readNumber()
        
        switch heroAction{
        case 1:
            
            let target = chooseEnemy(enemies: enemies)
            hero.basicAttack(target)
            
            break
        case 2:
            //specialAttack()
            break
        case 3:
            //openBag()
            break
        default:
            print("Falsche Eingabe")
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
    }

func lvlup(_ enemyTeam: [Enemy], _ selectedLevel: Int) -> [Enemy] {
    
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
