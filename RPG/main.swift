import Foundation

//Grundlegende Variablen

var heroTeam: [Hero] = []

var healingCost: Int = 0


// Tests:
//print(availableEnemies[generateEnemyIndexFromRare(enemies: availableEnemies)].name)
//print(sword1)
/*print(kirito.weapontype1)
print(kirito.weapontype2)
print(kirito.name)
print(kirito.def)
print(kirito.dex)
print(kirito.fullHp)
print(kirito.fullMp)
print(kirito.mp)
print(kirito.hp)
print(kirito.int)
print(kirito.lvl)
*/
//kirito.printDetails()
//print(kirito.basicAttack(rias))

// Startbildschirm

print("""
*************************************************************************
*                   ######     ##    ######## #######                   *
*                   ##  ##    ####   #  ##  #  ##  ##                   *
*                   ##       ##  ##     ##     ##                       *
*                   ####     ######     ##     ####                     *
*                   ##       ##  ##     ##     ##                       *
*                   ##       ##  ##     ##     ##  ##                   *
*                  ####      ##  ##    ####   #######                   *
*                                                                       *
*                                                                       *
*                                                                       *
*                       Spiel starten mit Enter                         *
*                                                                       *
*                                                                       *
*                                                                       *
*************************************************************************
""")
_ = readLine()

// Characterwahl
var isEnded: Bool = false


//var character1: AnyObject
var input: String = "0"

while !isEnded{

    switch input {
case "0":

print("""
*************************************************************************
*                                                                       *
*                      Wähle deinen Start-Helden:                       *
*                                                                       *
*                           1. Krieger Kirito                           *
*                           2. Druide Radagast                          *
*                           3. Waldläufer: Aragorn                      *
*                           4. Diebin Shion                             *
*                           5. Heilerin Milim                           *
*                           6. Zauberin Rias                            *
*                                                                       *
*                                                                       *
*                                                                       *
*                                                                       *
*                                                                       *
*************************************************************************
""")
input = readLine()!
    
    case "1":
        kirito.printDetails()
        print("Kirito wurde gewählt.")
     //   character1 = kirito
        heroTeam.append(kirito)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "2":
        radagast.printDetails()
        print("Radagast wurde gewählt.")
        //character1 = radagast
        heroTeam.append(radagast)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "3":
        aragorn.printDetails()
        print("Aragorn wurde gewählt.")
        //character1 = aragorn
        heroTeam.append(aragorn)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "4":
        shion.printDetails()
        print("Shion wurde gewählt.")
        //character1 = shion
        heroTeam.append(shion)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "5":
        milim.printDetails()
        print("Shion wurde gewählt.")
        //character1 = milim
        heroTeam.append(milim)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "6":
        rias.printDetails()
        print("Rias wurde gewählt.")
        //character1 = rias
        heroTeam.append(rias)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "99":
        print("Du bist ein Cheater...\n")
        createCheatTeam()
        print("\nDir wird das ultimative Team zur verfügung gestellt...")
        
        print("\nDein Lager wird gefüllt...")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    default:
        print("Falsche Eingabe...")
        input = "0"
    }
}

var menue: String? = "0"
isEnded = false

while !isEnded{
    switch menue {
    case "0":
        calculateHealingCost()
        menue = showcampMenu()
        
    case "1":
        print()
        
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "2":
        print()
        inventory.showInventory()
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "3":
        print()
        healGroup()
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "4":
        print()
        levelUp(hero: chooseHeroForLevelUp(heros: heroTeam))
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "5":
        print()
        startLevel()
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "6":
        print()
        
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    
    default:
        print()
        print("Eingabe nicht verfügbar, du wirst zum Hauptmenü weitergeleitet")
        sleep(2)
        menue = "0"
        
    }
}
