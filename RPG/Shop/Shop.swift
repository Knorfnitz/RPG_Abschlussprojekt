class Shop{
    let Inventory: [Inventory]
    let Heros: [Hero]
    //let Potions: [Potion]
    
    init(Inventory: [Inventory], Heros: [Hero]){
        self.Inventory = Inventory
        self.Heros = Heros
    }
    
    func showShop(){
        printLine()
        print("Willkommen im Shop: \n")
        print("1. Potions\n2. Helden\n\n9. Abbruch")
        printRows(rows: 2)
        printLine()
        print("Wähle eine Kategorie")
        let choosenCategory: Int = readNumber()
        
        switch choosenCategory {
        case 1:
            showShopPotions()
        case 2:
            showShopHeros()
        case 9:
            break
        default:
            print("Falsche Eingabe")
        }
        
    }
    func showShopForTerminal(){
        let showShopforTerminalTopic = "Willkommen im Shop:"
        let showShopforTerminalStringArray: [String] = [
            "[1] Potions",
            "[2] Helden",
            voidString,
            "[9] Abbruch",
            voidString,
            voidString,
            "Wähle eine Kategorie"
        ]
        generateTerminalWindowWithSouls(topic: showShopforTerminalTopic, printArray: showShopforTerminalStringArray, in: terminalWidth)
        
        let choosenCategory: Int = readNumber()
        
        switch choosenCategory {
        case 1:
            showShopPotionsForTerminal()
        case 2:
            showShopHerosForTerminal()
        case 9:
            break
        default:
            break
        }
        
    }
    
    func showShopPotions(){
        printLine()
        print("Potions: \n")
        
        for (i, potion) in potionList.enumerated(){
            print("\(i+1). \(potion.name) - \(potion.price)\n\(potion.description)\n")
        }
        print("Du hast \(souls) Seelen")
        print("Wähle eine Potion: (Abbruch mit 99)")
        printLine()
        let choosenPotion: Int = readNumber()
        
        if choosenPotion < potionList.count{
            buyPotions(potion: potionList[choosenPotion-1])
        }else{
            print("falsche Eingabe")
        }
    }
    
    func showShopPotionsForTerminal(){
        let showShopPotionsForTerminalTopic = "Potion Shop"
        var showShopPotionsForTerminalStringArray: [String] = []
        
        for (i, potion) in potionList.enumerated(){
            showShopPotionsForTerminalStringArray.append("[\(i+1)]. \(potion.name) - \(potion.price)")
            showShopPotionsForTerminalStringArray.append("\(potion.description)")
        }
        
        showShopPotionsForTerminalStringArray.append("Wähle eine Potion: (Abbruch mit [99])")
        generateTerminalWindowWithSouls(topic: showShopPotionsForTerminalTopic, printArray: showShopPotionsForTerminalStringArray, in: terminalWidth)
        
        let choosenPotion: Int = readNumber()
        
        if choosenPotion <= potionList.count && choosenPotion > 0{
            buyPotionsForTerminal(potion: potionList[choosenPotion-1])
        }
    }
    
    func showShopHeros(){
        printLine()
        if availableHerosForBuy.count > 0{
            print("Verfügbare Helden: \n")
            
            for (i, hero) in availableHerosForBuy.enumerated(){
                print ("\(i+1). \(hero.name)\n")
            }
            print("\nDer nächste Held kosten \(calculateHeroPrice()) Seelen.\n")
            
            if souls > calculateHeroPrice(){
                print("Welchen Helden möchtest du kaufen?\n")
                let chooseHeroToBuy: Int = readNumber()
                
                if chooseHeroToBuy <= availableHerosForBuy.count{
                    souls -= calculateHeroPrice()
                    
                    let buyedHero = availableHerosForBuy[chooseHeroToBuy-1]
                    heroTeam.append(buyedHero)
                    availableHerosForBuy.remove(at: chooseHeroToBuy-1)
                    
                    print("\(buyedHero.name) tritt deinem Team bei. Weiter mit Enter.\n")
                    printLine()
                }
                
            }else{
                print("Du hast nicht genug Seelen.\n")
                printLine()
            }
        }else{
            print("Du hast bereits alle Helden gekauft")
        }
    }
    
    
    func showShopHerosForTerminal(){
        let showShopHerosForTerminalTopic = "Helden Shop"
        var showShopHerosForTerminalArrayString: [String] = []
    
        if availableHerosForBuy.count > 0{
            showShopHerosForTerminalArrayString.append("Verfügbare Helden:")
            showShopHerosForTerminalArrayString.append(voidString)
            
            for (i, hero) in availableHerosForBuy.enumerated(){
                showShopHerosForTerminalArrayString.append("[\(i+1)] \(hero.name)")
                showShopHerosForTerminalArrayString.append(voidString)
            }
            showShopHerosForTerminalArrayString.append(voidString)
            showShopHerosForTerminalArrayString.append("Der nächste Held kosten \(calculateHeroPrice()) Seelen.")
            showShopHerosForTerminalArrayString.append(voidString)
            
            if souls > calculateHeroPrice(){
                showShopHerosForTerminalArrayString.append("Welchen Helden möchtest du kaufen?")
                
                generateTerminalWindowWithSouls(topic: showShopHerosForTerminalTopic, printArray: showShopHerosForTerminalArrayString, in: terminalWidth)
                
                let chooseHeroToBuy: Int = readNumber()
                
                if chooseHeroToBuy <= availableHerosForBuy.count && chooseHeroToBuy > 0{
                    
                    souls -= calculateHeroPrice()
                    let buyedHero = availableHerosForBuy[chooseHeroToBuy-1]
                    heroTeam.append(buyedHero)
                    availableHerosForBuy.remove(at: chooseHeroToBuy-1)
                    
                    showShopHerosForTerminalArrayString = []
                    showShopHerosForTerminalArrayString.append(voidString)
                    showShopHerosForTerminalArrayString.append(voidString)
                    showShopHerosForTerminalArrayString.append(voidString)
                    showShopHerosForTerminalArrayString.append("Herzlichen Glückwunsch!")
                    showShopHerosForTerminalArrayString.append("\(buyedHero.name) tritt deinem Team bei.")
                    showShopHerosForTerminalArrayString.append(voidString)
                    showShopHerosForTerminalArrayString.append(enterString)
                    
                    generateTerminalWindowWithSoulAndCenterd(topic: showShopHerosForTerminalTopic, printArray: showShopHerosForTerminalArrayString, in: terminalWidth)
                    _ = readLine()
                }
                
            }else{
                showShopHerosForTerminalArrayString = []
                showShopHerosForTerminalArrayString.append(voidString)
                showShopHerosForTerminalArrayString.append(voidString)
                showShopHerosForTerminalArrayString.append(voidString)
                showShopHerosForTerminalArrayString.append("Du hast nicht genug Seelen.")
                showShopHerosForTerminalArrayString.append(voidString)
                showShopHerosForTerminalArrayString.append("Der nächste Held kostet \(calculateHeroPrice()) Seelen.")
                showShopHerosForTerminalArrayString.append(voidString)
                showShopHerosForTerminalArrayString.append(enterString)
                
                generateTerminalWindowWithSoulAndCenterd(topic: showShopHerosForTerminalTopic, printArray: showShopHerosForTerminalArrayString, in: terminalWidth)
                _ = readLine()
            }
        }else{
            showShopHerosForTerminalArrayString = []
            showShopHerosForTerminalArrayString.append(voidString)
            showShopHerosForTerminalArrayString.append(voidString)
            showShopHerosForTerminalArrayString.append(voidString)
            showShopHerosForTerminalArrayString.append("Du hast bereits alle Helden gekauft")
            showShopHerosForTerminalArrayString.append(voidString)
            showShopHerosForTerminalArrayString.append(enterString)
            
            generateTerminalWindowWithSoulAndCenterd(topic: showShopHerosForTerminalTopic, printArray: showShopHerosForTerminalArrayString, in: terminalWidth)
            _ = readLine()
        }
    }
    
    
    func buyPotions(potion: Potion){
        print("Die \(potion.name) kostet \(potion.price) Seelen.\n")
        print("Du hast \(souls) Seelen\n")
        print("Wie viele möchtest du kaufen? (Keine = 0)\n")
        let amountOfBuyingPotions = readNumber()
        let price = amountOfBuyingPotions * potion.price
        
        if price <= souls{
            souls -= price
            print("Du hast \(amountOfBuyingPotions) \(potion.name) gekauft.\n")
           // let originIndexOfPotion = inventory.potions.firstIndex(where: {$0.name == potion.name} )
            
            potion.amount += amountOfBuyingPotions
        
            print("Du hast \(amountOfBuyingPotions)x \(potion.name) für \(price) Seelen gekauft. Weiter mit Enter\n")
            _ = readLine()
            }
        else{
            print("Du hast nicht genug Seelen. Weiter mit Enter\n")
            _ = readLine()
        }
        
    }
    
    func buyPotionsForTerminal(potion: Potion){
        let buyPotionsForTerminalTopic = "Potion kaufen"
        var buyPotionsForTerminalStringArray: [String] = [
        "Die \(potion.name) kostet \(potion.price) Seelen.",
        voidString,
        voidString,
        "Wie viele möchtest du kaufen? (Keine = [0])"
        ]
        
        generateTerminalWindowWithSoulAndCenterd(topic: buyPotionsForTerminalTopic, printArray: buyPotionsForTerminalStringArray, in: terminalWidth)
        
        let amountOfBuyingPotions = readNumber()
        
        let price = amountOfBuyingPotions * potion.price
        
        if price <= souls{
            souls -= price
            potion.amount += amountOfBuyingPotions
            
            buyPotionsForTerminalStringArray = []
            buyPotionsForTerminalStringArray.append(voidString)
            buyPotionsForTerminalStringArray.append(voidString)
            buyPotionsForTerminalStringArray.append(voidString)
            buyPotionsForTerminalStringArray.append("Du hast \(amountOfBuyingPotions) \(potion.name)")
            buyPotionsForTerminalStringArray.append(voidString)
            buyPotionsForTerminalStringArray.append("für \(price) Seelen gekauft")
            buyPotionsForTerminalStringArray.append(voidString)
            buyPotionsForTerminalStringArray.append(enterString)
        
            generateTerminalWindowWithSoulAndCenterd(topic: buyPotionsForTerminalTopic, printArray: buyPotionsForTerminalStringArray, in: terminalWidth)
            _ = readLine()
            }
        else{
            buyPotionsForTerminalStringArray = []
            buyPotionsForTerminalStringArray.append(voidString)
            buyPotionsForTerminalStringArray.append(voidString)
            buyPotionsForTerminalStringArray.append(voidString)
            buyPotionsForTerminalStringArray.append("Du hast nicht genug Seelen")
            buyPotionsForTerminalStringArray.append(voidString)
            buyPotionsForTerminalStringArray.append(enterString)
        
            generateTerminalWindowWithSoulAndCenterd(topic: buyPotionsForTerminalTopic, printArray: buyPotionsForTerminalStringArray, in: terminalWidth)
            _ = readLine()
            
        }
        
    }
    
    
    func calculateHeroPrice() -> Int{
        let howManyHerosAreAvailable:Int = availableHerosForBuy.count
        let price: Int = 1000
        
        switch howManyHerosAreAvailable{
        case 0:
            print("Du hast keine Heros mehr.\n")
            return 0
        case 1:
            return price * 62
        case 2:
            return price * 32
        case 3:
            return price * 16
        case 4:
            return price * 8
        case 5:
            return price * 4
        case 6:
            return price * 2
        case 7:
            return price
        default:
            return 0
        }
        
    }
}

let shop: Shop = Shop(Inventory: [inventory], Heros: heroTeam)
