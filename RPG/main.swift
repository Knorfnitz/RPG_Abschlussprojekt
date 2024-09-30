import Foundation

//Grundlegende Variablen

var heroTeam: [Hero] = []
var availableHerosForBuy: [Hero] = []

var healingCost: Int = 0

var isEnded: Bool = false

let enterString: String = "Drücke Enter für weiter"

let terminalWidth: Int = 92
let terminalHeight: Int = 22
let frequenz: Double = 0.01



let GlobalTerminal: Int = 1

scaleTerminal()
_ = readLine()
fadeinWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)

fadeoutWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)
startScreen(terminal: GlobalTerminal)
_ = readLine()
fadeinWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)
    
    // Characterwahl

    
let chosenHero: String = choseStartCharacterWindow(terminal: GlobalTerminal)


choseStartCharacter(terminal: GlobalTerminal, hero: chosenHero)



campMenu(terminal: GlobalTerminal)
 /*
    var menue: String? = "0"
    isEnded = false
    
    while !isEnded{
        switch menue {
        case "0":
            calculateHealingCost()
            menue = showcampMenu()
            
        case "1":
            print()
            let newHeroOrder: [Hero] = swapHeroTeam(heros: heroTeam)
            heroTeam = newHeroOrder
            print()
            // print("Weiter mit Enter!")
            // _ = readLine()
            menue = "0"
        case "2":
            print()
            inventory.showInventory()
            print()
            // print("Weiter mit Enter!")
            //_ = readLine()
            menue = "0"
        case "3":
            print()
            healGroup()
            print()
            menue = "0"
        case "4":
            print()
            levelUp(hero: chooseHeroForLevelUp(heros: heroTeam))
            print()
            
            menue = "0"
        case "5":
            print()
            startLevel()
            print()
            
            menue = "0"
        case "6":
            print()
            shop.showShop()
            print()
            menue = "0"
            
        default:
            print()
            print("Eingabe nicht verfügbar, du wirst zum Hauptmenü weitergeleitet")
            sleep(2)
            menue = "0"
            
        }
    }
    */
