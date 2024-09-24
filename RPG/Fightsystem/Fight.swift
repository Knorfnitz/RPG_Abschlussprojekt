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
    var fight: Bool = true
    while fight{
        for hero in heroTeam{
            if hero.hp > 0{
                showEnemiesAndWaitForHeroAction(hero: hero, enemies: enemyTeam)
                if areAllEnemiesDead(enemyTeam){
                    print("Du hast alle Gegner besiegt")
                    //generateLoot(enemies)
                    //showcampMenu()
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
    for _ in 1...enemiesCount{
        let index: Int = Int.random(in: 0...availableEnemies.count - 1)
        enemyTeam.append(availableEnemies[index])
    }
    return enemyTeam
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



    func showSelectActionMenu(){
    
}
/*

    let input: String = readLine()!
    if input.isNumber {
        if Int(input)! <= maxLvl{
                waterSlime.increaseLvl(Int(input)!)
                goblinwarrior.increaseLvl(Int(input)!)
                enemieTeam.append(waterSlime)
                enemieTeam.append(goblinwarrior)
                //enemieTeam.remove(at: 0)
                
                //geh zum kampf
                gotoFight(heros: heroTeam, enemies: enemieTeam)
            }else{
                print("das level ist noch nicht verfügbar")
            }
        }else{
            print("Falsche Eingabe")
        }
 
}*/
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
        let aliveHeros:[Hero] = heros.filter{$0.hp > 0}
        let randomHero: Int = Int.random(in: 0...aliveHeros.count - 1)
        attackHero(enemy: enemy, hero: heros[randomHero])
        
    }
}


func attackHero(enemy: Enemy, hero: Hero){
    print("\(enemy.name) greift \(hero.name) mit \(enemy.damage) an")
    hero.hp -= enemy.damage
    }

func restartLevel(heros: [Hero]){
    souls = 0
    for hero in heros{
        hero.hp = hero.fullHp
        hero.mp = hero.fullMp
    }
}













/*func gotoFight(heros h:[Hero],enemies e:[Enemy]){
    var eCopy = e
    while eCopy.count >= 1{
        for hero in h{
            
            print("""
            *************************************************************************
            Deine Gegner:

            """)
            for (i, enemy) in e.enumerated(){
                print("\(i+1): \(enemy.name) (Level: \(enemy.lvl))")
            }
                                                                                
            print("""
                      





                                      
            *************************************************************************
            """)
            
            if eCopy.count > 1{
                print("Welchen Gegner möchtest du angreifen")
                let target: String = readLine()!
                if target.isNumber{
                    let targetNumber = Int(target)!
                    if targetNumber <= eCopy.count{
                        hero.basicAttack(hero, eCopy[targetNumber])
                        
                        if isDead(enemie:eCopy, index: targetNumber-1){
                            eCopy.remove(at: 0)
                        }
                    }else{
                        print("Falsche Eingabe, es wird automatisch der erste Gegner angegriffen")
                        hero.basicAttack(hero, eCopy[0])
                        
                        if isDead(enemie:eCopy, index: 0){
                            eCopy.remove(at: 0)
                        }
                    }
                }else{
                    print("Falsche Eingabe, es wird automatisch der erste Gegner angegriffen")
                    hero.basicAttack(hero, eCopy[0])
                  
                    if isDead(enemie:eCopy, index: 0){
                        eCopy.remove(at: 0)
                    }
                }
            }else if eCopy.count == 1{
                hero.basicAttack(hero, eCopy[0])
                //print(eCopy[0].hp)
                if isDead(enemie:eCopy, index: 0){
                    eCopy.remove(at: 0)
                }
            }
        }
    }
    if eCopy.count == 0{
        print("Du hast gewonnen")
    }
}

func isDead(enemie e: [Enemy], index i: Int) -> Bool{
    return e[i].hp <= 0
}
*/


