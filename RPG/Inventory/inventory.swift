class Inventory {
    var potions: [Potion]
    var armors: [Armor]
    var weapons: [Weapon]
    
    init(potions: [Potion], armors: [Armor], weapons: [Weapon]) {
        self.potions = potions
        self.armors = armors
        self.weapons = weapons
    }
    
    func showInventory(){
        printLine()
        print("Inventar: \n")
        print("1. Potions\n2. Rüstungen\n3. Waffen\n\n9. Abbruch")
        printRows(rows: 2)
        printLine()
        print("Wähle eine Kategorie")
        let choosenCategory: Int = readNumber()
        
        switch choosenCategory {
        case 1:
            showPotions()
        case 2:
            showArmors()
        case 3:
            showWeapons()
        case 9:
            break
        default:
            print("Falsche Eingabe")
        }
        
    }
    
    func showInventoryForTerminal(){
        let inventoryTopic:String = "Inventar:"
        let inventoryStringArray: [String] = [
        "[1] Potions",
        "[2] Rüstungen",
        "[3] Waffen",
        voidString,
        "[9] Abbruch",
        voidString,
        voidString,
        "Wähle eine Kategorie."
        ]
       
        generateTerminalWindowWithSouls(topic: inventoryTopic, printArray: inventoryStringArray, in: terminalWidth)
       
        
        let choosenCategory: Int = readNumber()
        
        switch choosenCategory {
        case 1:
            showPotionsForTerminal()
        case 2:
            showArmorsForTerminal()
        case 3:
            showWeaponsForTerminal()
        case 9:
            break
        default:
            break
        }
        
    }
    
    func showPotions(){
        printLine()
        print("Potions:")
        
        let filteredPotionList = inventory.potions.filter { $0.amount > 0}
        
        for (i, potion) in filteredPotionList.enumerated() {
            print("\(i+1).\t\(potion.name)\tAnzahl: \(potion.amount)\tVerkaufspreis: \(potion.sellPrice)\t\t Beschreibung: \(potion.description)")
            print()
            
        }
        if filteredPotionList.count > 0{
            print("Wähle ein Item (99 für Abbruch)\n")
            let choosePotionNr = readNumber()
            if choosePotionNr <= filteredPotionList.count{
                let choosenPotion = filteredPotionList[choosePotionNr-1]
                print(choosenPotion.amount)
                waitForPotionActionAndDoChoosenAction(potion: choosenPotion)
                
            }
        }else{
            print("Keine Potions vorhanden")
        }
        printLine()
    }
    
    func showPotionsForTerminal(){
        let potionTopic: String = "Potions:"
        var potionStringArray: [String] = []
        let filteredPotionList = inventory.potions.filter { $0.amount > 0}
        
        for (i, potion) in filteredPotionList.enumerated() {
            potionStringArray.append("[\(i+1)] \(potion.name)  Anzahl: \(potion.amount)  Verkaufspreis: \(potion.sellPrice)")
            potionStringArray.append("Beschreibung: \(potion.description)")
            potionStringArray.append(voidString)
        }
        if filteredPotionList.count > 0{
            potionStringArray.append(voidString)
            potionStringArray.append("Wähle ein Item ([99] für Abbruch)")
           
            generateTerminalWindowWithSouls(topic: potionTopic, printArray: potionStringArray, in: terminalWidth)
        
            let choosePotionNr = readNumber()
            if choosePotionNr <= filteredPotionList.count && choosePotionNr > 0{
                let choosenPotion = filteredPotionList[choosePotionNr-1]
               
                waitForPotionActionAndDoChoosenActionForTerminal(potion: choosenPotion)
            }
        }else{
            potionStringArray.append(voidString)
            potionStringArray.append("Keine Potions vorhanden")
           
         
            generateTerminalWindowWithSouls(topic: potionTopic, printArray: potionStringArray, in: terminalWidth)
         
            _ = readLine()
        }
    }
    
    func showArmors(){
        printLine()
        print("Rüstungen:\n")
        let filteredArmorList = inventory.armors.filter { $0.amount > 0}
        
        for (i, armor) in filteredArmorList.enumerated() {
            print("\(i+1).\t\(armor.name)\tAnzahl: \(armor.amount)\tVerkaufspreis: \(armor.sellPrice)\t\t Werte: HP: +\(armor.extraHP) \tDEF: +\(armor.extraDEF)")
            print()
            
        }
        if filteredArmorList.count > 0{
            print("Wähle eine Rüstung (99 für Abbruch)\n")
            let chooseArmorNr = readNumber()
            if chooseArmorNr <= filteredArmorList.count{
                var choosenArmor = filteredArmorList[chooseArmorNr-1]
                
                //print(choosenArmor.amount)
                waitForArmorActionAndDoChoosenAction(armor: &choosenArmor)
            }
        }else{
            print("Keine Rüstungen vorhanden")
        }
        printLine()
    }
    
    func showArmorsForTerminal(){
        let showArmorsForTerminalTopic: String = "Rüstungen:"
        var showArmorsForTerminalStringArray: [String] = []
        let filteredArmorList = inventory.armors.filter { $0.amount > 0}
        
        for (i, armor) in filteredArmorList.enumerated() {
            showArmorsForTerminalStringArray.append("[\(i+1)] \(armor.name)  Anzahl: \(armor.amount)  Verkaufspreis: \(armor.sellPrice)  Werte: HP: +\(armor.extraHP)  DEF: +\(armor.extraDEF)")
            showArmorsForTerminalStringArray.append(voidString)
        }
        if filteredArmorList.count > 0{
            showArmorsForTerminalStringArray.append(voidString)
            showArmorsForTerminalStringArray.append("Wähle eine Rüstung ([99] für Abbruch)")
            
            generateTerminalWindowWithSouls(topic: showArmorsForTerminalTopic, printArray: showArmorsForTerminalStringArray, in: terminalWidth)
            
            let chooseArmorNr = readNumber()
            if chooseArmorNr <= filteredArmorList.count && chooseArmorNr > 0{
                var choosenArmor = filteredArmorList[chooseArmorNr-1]
                
                waitForArmorActionAndDoChoosenActionForTerminal(armor: &choosenArmor)
            }
        }else{
            showArmorsForTerminalStringArray.append(voidString)
            showArmorsForTerminalStringArray.append("Keine Rüstungen vorhanden")
            
            generateTerminalWindowWithSouls(topic: showArmorsForTerminalTopic, printArray: showArmorsForTerminalStringArray, in: terminalWidth)
            _ = readLine()
        }
    }
    
    func showWeapons(){
        printLine()
        print("Waffen:\n")
        let filteredWeaponsList = inventory.weapons.filter { $0.amount > 0}
        
        for (i, weapon) in filteredWeaponsList.enumerated() {
            print("\(i+1).\t\(weapon.name)\tAnzahl: \(weapon.amount)\tVerkaufspreis: \(weapon.sellPrice)")
            print("Werte: HP: +\(weapon.extraHP) \tMP: +\(weapon.extraMP) \tSTK: +\(weapon.extraSTR) \tDEF: +\(weapon.extraDEF) \t INT: +\(weapon.extraINT) \tDEX: +\(weapon.extraDEX)")
            print()
            
        }
        if filteredWeaponsList.count > 0{
            print("Wähle eine Rüstung (99 für Abbruch)\n")
            let chooseWeaponNr = readNumber()
            if chooseWeaponNr <= filteredWeaponsList.count{
                var choosenWeapon = filteredWeaponsList[chooseWeaponNr-1]
                
                print(choosenWeapon.amount)
                waitForWeaponActionAndDoChoosenAction(weapon: &choosenWeapon)
            }
        }else{
            print("Keine Rüstungen vorhanden")
        }
        printLine()
    }
        
    func showWeaponsForTerminal(){
        let showWeaponsForTerminalTopic: String = "Waffen:"
        var showWeaponsForTerminalStringArray: [String] = []
        let filteredWeaponsList = inventory.weapons.filter { $0.amount > 0}
        
        for (i, weapon) in filteredWeaponsList.enumerated() {
            showWeaponsForTerminalStringArray.append("[\(i+1)] \(weapon.name)  Anzahl: \(weapon.amount)  Verkaufspreis: \(weapon.sellPrice)")
            showWeaponsForTerminalStringArray.append("Werte: HP: +\(weapon.extraHP) MP: +\(weapon.extraMP)  STK: +\(weapon.extraSTR) DEF: +\(weapon.extraDEF)  INT: +\(weapon.extraINT)  DEX: +\(weapon.extraDEX)")
            showWeaponsForTerminalStringArray.append(voidString)
        }
        if filteredWeaponsList.count > 0{
            showWeaponsForTerminalStringArray.append(voidString)
            showWeaponsForTerminalStringArray.append("Wähle eine Waffe ([99] für Abbruch)")
            
            generateTerminalWindowWithSouls(topic: showWeaponsForTerminalTopic, printArray: showWeaponsForTerminalStringArray, in: terminalWidth)
            
            let chooseWeaponNr = readNumber()
            if chooseWeaponNr <= filteredWeaponsList.count && chooseWeaponNr > 0{
                var choosenWeapon = filteredWeaponsList[chooseWeaponNr-1]
                
                waitForWeaponActionAndDoChoosenActionForTerminal(weapon: &choosenWeapon)
            }
        }else{
            showWeaponsForTerminalStringArray.append(voidString)
            showWeaponsForTerminalStringArray.append("Keine Waffen vorhanden")
            
            generateTerminalWindowWithSouls(topic: showWeaponsForTerminalTopic, printArray: showWeaponsForTerminalStringArray, in: terminalWidth)
                                                
            _ = readLine()
        }
 
    }
    
    
    func waitForPotionActionAndDoChoosenAction(potion: Potion){
        printRows(rows: 2)
        printLine()
        print(potion.name)
        print(potion.amount)
        print("Wähle eine Aktion:\n")
        print("1. Benutzen")
        print("2. Verkaufen")
        print()
        print("9. Abbruch")
        printLine()
        
        let choosenAction = readNumber()
        switch choosenAction{
        case 1:
            usePotion(potion: potion)
        case 2:
            sellPotion(potion: potion)
        case 9:
            break
        default:
            print("Falsche Eingabe")
        }
    }
    
    func waitForPotionActionAndDoChoosenActionForTerminal(potion: Potion){
        let waitForPotionActionTopic = "Potions"
        let waitForPotionStringArray: [String] = [
        potion.name,
        "Im Besitz: \(potion.amount)",
        voidString,
        "Wähle eine Aktion:",
        "[1] Benutzen",
        "[2] Verkaufen",
        voidString,
        "[9] Abbruch"
        ]
      
        generateTerminalWindowWithSouls(topic: waitForPotionActionTopic, printArray: waitForPotionStringArray, in: terminalWidth)
        
        let choosenAction = readNumber()
        switch choosenAction{
        case 1:
            usePotionForTerminal(potion: potion)
        case 2:
            sellPotionForTerminal(potion: potion)
        case 9:
            break
        default:
            break
        }
    }
    
    func waitForArmorActionAndDoChoosenAction(armor: inout Armor){
        printRows(rows: 2)
        printLine()
        print(armor.name)
        print(armor.amount)
        print("Wähle eine Aktion:\n")
        print("1. Ausrüsten")
        print("2. Verkaufen")
        print()
        print("9. Abbruch")
        printLine()
        
        let choosenAction = readNumber()
        switch choosenAction{
        case 1:
            showEquipArmorDialog(armor: armor)
        case 2:
            sellArmor(armor: &armor)
            
        case 9:
            break
        default:
            print("Falsche Eingabe")
        }
    }
    
    func waitForArmorActionAndDoChoosenActionForTerminal(armor: inout Armor){
        let waitForArmorActionAndDoChoosenActionForTerminalTopic = "Rüstungen"
        let waitForArmorActionAndDoChoosenActionForTerminalStringArray: [String] = [
        armor.name,
        "Im Besitz: \(armor.amount)",
        voidString,
        "Wähle eine Aktion:",
        "[1] Ausrüsten",
        "[2] Verkaufen",
        voidString,
        "[9] Abbruch"
        ]
        generateTerminalWindowWithSouls(topic: waitForArmorActionAndDoChoosenActionForTerminalTopic, printArray: waitForArmorActionAndDoChoosenActionForTerminalStringArray, in: terminalWidth)
        
        let choosenAction = readNumber()
        switch choosenAction{
        case 1:
            showEquipArmorDialogForTerminal(armor: armor)
        case 2:
            sellArmorForTerminal(armor: &armor)
            
        case 9:
            break
        default:
            print("Falsche Eingabe")
        }
    }
    
    func waitForWeaponActionAndDoChoosenAction(weapon: inout Weapon){
        printRows(rows: 2)
        printLine()
        print(weapon.name)
        print(weapon.amount)
        print("Wähle eine Aktion:\n")
        print("1. Ausrüsten")
        print("2. Verkaufen")
        print()
        print("9. Abbruch")
        printLine()
        
        let choosenAction = readNumber()
        switch choosenAction{
        case 1:
            showEquipWeaponDialog(weapon: weapon)
        case 2:
            sellWeapon(weapon: &weapon)
            
        case 9:
            break
        default:
            break
        }
    }
    
    func waitForWeaponActionAndDoChoosenActionForTerminal(weapon: inout Weapon){
        let waitForWeaponActionAndDoChoosenActionForTerminalTopic = "Waffen"
        let waitForWeaponActionAndDoChoosenActionForTerminalStringArray: [String] = [
            weapon.name,
        "Im Besitz: \(weapon.amount)",
        voidString,
        "Wähle eine Aktion:",
        "[1] Ausrüsten",
        "[2] Verkaufen",
        voidString,
        "[9] Abbruch"
        ]
        generateTerminalWindowWithSouls(topic: waitForWeaponActionAndDoChoosenActionForTerminalTopic, printArray: waitForWeaponActionAndDoChoosenActionForTerminalStringArray, in: terminalWidth)
    
        let choosenAction = readNumber()
        switch choosenAction{
        case 1:
            showEquipWeaponDialogForTerminal(weapon: weapon)
        case 2:
            sellWeaponForTerminal(weapon: &weapon)
            
        case 9:
            break
        default:
            break
        }
    }
    
    
    func printHeroTeamForItems(){
        for (i, hero) in heroTeam.enumerated(){
            
            print("\(i+1).  \(hero.name)\t HP: (\(hero.hp)/\(hero.fullHp))\t MP: (\(hero.mp)/\(hero.fullMp))\t")
            
        }
    }
    
    func printHeroTeamForItemsForTerminal() -> [String]{
        var heroItemListStringArray: [String] = []
        
        for (i, hero) in heroTeam.enumerated(){
            
            heroItemListStringArray.append("[\(i+1)] \(hero.name) HP: (\(hero.hp)/\(hero.fullHp)) MP: (\(hero.mp)/\(hero.fullMp))")
            
        }
        return heroItemListStringArray
    }
    
    func usePotion(potion: Potion){
        print("Bei wem möchtest du \(potion.name) benutzen?\n")
        printHeroTeamForItems()
        let chooseHero = readNumber()
        if chooseHero <= heroTeam.count{
            if potion.potionType == 1{
                heroTeam[chooseHero-1].hp += potion.amountOfHeal
                print("\(heroTeam[chooseHero-1].name)´s HP wurde um \(potion.amountOfHeal) geheilt!")
                potion.amount -= 1
            }else{
                heroTeam[chooseHero-1].mp += potion.amountOfHeal
                print("\(heroTeam[chooseHero-1].name)´MP wurde um \(potion.amountOfHeal) regeneriert!")
                potion.amount -= 1
            }
        }
    }
    func usePotionForTerminal(potion: Potion){
        let usePotionTopic: String = "Potion benutzen"
        var usePotionStrngArray: [String] = []
        usePotionStrngArray.append("Bei wem möchtest du \(potion.name) benutzen?")
        usePotionStrngArray.append(voidString)
        
        usePotionStrngArray.append(contentsOf: printHeroTeamForItemsForTerminal())
        usePotionStrngArray.append(voidString)
        
       
        generateTerminalWindowWithSouls(topic: usePotionTopic, printArray: usePotionStrngArray, in: terminalWidth)
        
        let chooseHero = readNumber()
      
        
        if chooseHero > 0 && chooseHero <= heroTeam.count {
            
            
            
            if potion.potionType == 1{
                usePotionStrngArray = []
                heroTeam[chooseHero-1].hp += potion.amountOfHeal
                
                usePotionStrngArray.append(voidString)
                usePotionStrngArray.append(voidString)
                usePotionStrngArray.append(voidString)
                usePotionStrngArray.append("\(heroTeam[chooseHero-1].name)´s HP wurde um \(potion.amountOfHeal) geheilt!")
                potion.amount -= 1
                
              
                generateTerminalWindowWithSoulAndCenterd(topic: usePotionTopic, printArray: usePotionStrngArray, in: terminalWidth)
          
                
            }else{
                usePotionStrngArray = []
                
                heroTeam[chooseHero-1].mp += potion.amountOfHeal
                
                usePotionStrngArray.append(voidString)
                usePotionStrngArray.append(voidString)
                usePotionStrngArray.append(voidString)
                usePotionStrngArray.append("\(heroTeam[chooseHero-1].name)´MP wurde um \(potion.amountOfHeal) regeneriert!")
                
                potion.amount -= 1
                
             
                generateTerminalWindowWithSoulAndCenterd(topic: usePotionTopic, printArray: usePotionStrngArray, in: terminalWidth)
            
            }
        }
        }
    

    
    func showEquipArmorDialog(armor: Armor){
        printLine()
        print("Welchem Helden möchtest du die Rüstung \(armor.name) anziehen?")
        printHeroTeamForItems()
        let chosenHero = chooseHero()
        let currentArmor = chosenHero.armor
        if currentArmor == nil{
            chosenHero.armor = armor
            addArmorStats(hero: chosenHero, armor: armor, modifier: 1)
            let originIndexOfNewArmor = self.armors.firstIndex(where: {$0.name == armor.name} )
            self.armors[originIndexOfNewArmor!].amount -= 1
            
            
            print("Du hast \(armor.name) ausgerüstet!")
            waitForInput()
        }else{
            let originIndexOfArmor = self.armors.firstIndex(where: {$0.name == currentArmor!.name} )
            var originArmor = self.armors[originIndexOfArmor!]
            originArmor.amount += 1
            self.armors[originIndexOfArmor!] = originArmor
            chosenHero.armor = armor
            let originIndexOfNewArmor = self.armors.firstIndex(where: {$0.name == armor.name} )
            self.armors[originIndexOfNewArmor!].amount -= 1
            addArmorStats(hero: chosenHero, armor: originArmor, modifier: -1)
            addArmorStats(hero: chosenHero, armor: armor, modifier: 1)
            
            
            print("Du hast \(originArmor.name) ins Inventar gelegt und \(armor.name) ausgerüstet!")
            waitForInput()
        }
        
    }
    
    func showEquipArmorDialogForTerminal(armor: Armor){
        let showEquipArmorDialogForTerminalTopic: String = "Rüstung ausrüsten"
        var showEquipArmorDialogForTerminalStringArray: [String] = []
        
        showEquipArmorDialogForTerminalStringArray.append("Welchem Helden möchtest du")
        showEquipArmorDialogForTerminalStringArray.append("die Rüstung \(armor.name) anziehen?")
        showEquipArmorDialogForTerminalStringArray.append(voidString)
        showEquipArmorDialogForTerminalStringArray.append(contentsOf: printHeroTeamForItemsForTerminal())
        
        generateTerminalWindowWithSouls(topic: showEquipArmorDialogForTerminalTopic, printArray: showEquipArmorDialogForTerminalStringArray, in: terminalWidth)
        
        let chosenHero = chooseHeroForTerminal()
    
        let currentArmor = chosenHero.armor
        
        
        
        if currentArmor == nil{
            chosenHero.armor = armor
            addArmorStats(hero: chosenHero, armor: armor, modifier: 1)
            let originIndexOfNewArmor = self.armors.firstIndex(where: {$0.name == armor.name} )
            self.armors[originIndexOfNewArmor!].amount -= 1
            
            showEquipArmorDialogForTerminalStringArray = []
            showEquipArmorDialogForTerminalStringArray.append(voidString)
            showEquipArmorDialogForTerminalStringArray.append(voidString)
            showEquipArmorDialogForTerminalStringArray.append(voidString)
            showEquipArmorDialogForTerminalStringArray.append("\(chosenHero.name) hat \(armor.name) ausgerüstet!")
            
            generateTerminalWindowWithSoulAndCenterd(topic: showEquipArmorDialogForTerminalTopic, printArray: showEquipArmorDialogForTerminalStringArray, in: terminalWidth)
            
            _ = readLine()
        }else{
            let originIndexOfArmor = self.armors.firstIndex(where: {$0.name == currentArmor!.name} )
            var originArmor = self.armors[originIndexOfArmor!]
            originArmor.amount += 1
            self.armors[originIndexOfArmor!] = originArmor
            chosenHero.armor = armor
            let originIndexOfNewArmor = self.armors.firstIndex(where: {$0.name == armor.name} )
            self.armors[originIndexOfNewArmor!].amount -= 1
            addArmorStats(hero: chosenHero, armor: originArmor, modifier: -1)
            addArmorStats(hero: chosenHero, armor: armor, modifier: 1)
            
            showEquipArmorDialogForTerminalStringArray = []
            showEquipArmorDialogForTerminalStringArray.append(voidString)
            showEquipArmorDialogForTerminalStringArray.append(voidString)
            showEquipArmorDialogForTerminalStringArray.append(voidString)
            showEquipArmorDialogForTerminalStringArray.append("\(chosenHero.name) hat \(originArmor.name) ins Inventar gelegt und \(armor.name) ausgerüstet!")
            
            generateTerminalWindowWithSoulAndCenterd(topic: showEquipArmorDialogForTerminalTopic, printArray: showEquipArmorDialogForTerminalStringArray, in: terminalWidth)
            
            _ = readLine()
           
        }
        
    }
    
    func addArmorStats(hero: Hero, armor: Armor, modifier: Int){
        hero.fullHp += armor.extraHP * modifier
        hero.def += armor.extraDEF * modifier
    }
    
    func addWeaponStats(hero: Hero, weapon: Weapon, modifier: Int){
        hero.fullHp += weapon.extraHP * modifier
        hero.fullMp += weapon.extraMP * modifier
        hero.def += weapon.extraDEF * modifier
        hero.str += weapon.extraSTR * modifier
        hero.int += weapon.extraINT * modifier
        hero.dex += weapon.extraDEX * modifier
    }
    
    func chooseHero() -> Hero{
        let inputNumber = readNumber()
        if inputNumber <= heroTeam.count && inputNumber > 0{
            let hero = heroTeam[inputNumber-1]
            
            return hero
        }else{
            
            return chooseHero()
        }
    }
    
    func chooseHeroForTerminal() -> Hero{
        let inputNumber = readNumber()
        if inputNumber <= heroTeam.count && inputNumber > 0{
            let hero = heroTeam[inputNumber-1]
          
            return hero
        }else{
            return chooseHeroForTerminal()
        }
    }
    
    func chooseHeroFromArray(array: [Hero]) -> Hero{
        let inputNumber = readNumber()
        if inputNumber <= array.count && inputNumber > 0{
            let hero = array[inputNumber-1]
            
            return hero
        }else{

            return chooseHeroFromArray(array: array)
        }
    }
    
    
    func showEquipWeaponDialog(weapon: Weapon){
        printLine()
        print("Welchem Helden möchtest du diese Waffe \(weapon.name) geben?")
        let herosWhoCanEquipWeapon = printHerosWhoCanEquipWeapon(weapon: weapon)
        if herosWhoCanEquipWeapon.isEmpty{
            print("Derzeit kann kein Held die Waffe tragen")
        }else{
            let chosenHero = chooseHeroFromArray(array: herosWhoCanEquipWeapon)
            let currentWeapon = chosenHero.weapon
            if currentWeapon == nil{
                chosenHero.weapon = weapon
                addWeaponStats(hero: chosenHero, weapon: weapon, modifier: 1)
                let originIndexOfNewWeapon = self.weapons.firstIndex(where: {$0.name == weapon.name} )
                self.weapons[originIndexOfNewWeapon!].amount -= 1
                
                print("Du hast \(weapon.name) ausgerüstet!")
                waitForInput()
            }else{
                let originIndexOfWeapon = self.weapons.firstIndex(where: {$0.name == currentWeapon!.name} )
                var originWeapon = self.weapons[originIndexOfWeapon!]
                originWeapon.amount += 1
                self.weapons[originIndexOfWeapon!] = originWeapon
                chosenHero.weapon = weapon
                let originIndexOfNewWeapon = self.weapons.firstIndex(where: {$0.name == weapon.name} )
                self.weapons[originIndexOfNewWeapon!].amount -= 1
                addWeaponStats(hero: chosenHero, weapon: originWeapon, modifier: -1)
                addWeaponStats(hero: chosenHero, weapon: weapon, modifier: 1)
                
                print("Du hast \(originWeapon.name) ins Inventar gelegt und \(weapon.name) ausgerüstet!")
                waitForInput()
            }
        }
    }
    
    func showEquipWeaponDialogForTerminal(weapon: Weapon){
        
        let showEquipWeaponDialogForTerminalTopic = "Waffen ausrüsten"
        var showEquipWeaponDialogForTerminalStringArray: [String] = []
        
        showEquipWeaponDialogForTerminalStringArray.append("Helden, die die Waffe")
        showEquipWeaponDialogForTerminalStringArray.append("\(weapon.name) tragen können:")
        showEquipWeaponDialogForTerminalStringArray.append(voidString)
        
        let herosWhoCanEquipWeapon = herosWhoCanEquipWeaponForTerminal(weapon: weapon)
        
        if herosWhoCanEquipWeapon.isEmpty{
            
            showEquipWeaponDialogForTerminalStringArray.append(voidString)
            showEquipWeaponDialogForTerminalStringArray.append("Derzeit kann kein Held die Waffe tragen")

            generateTerminalWindowWithSouls(topic: showEquipWeaponDialogForTerminalTopic, printArray: showEquipWeaponDialogForTerminalStringArray, in: terminalWidth)
            
            _ = readLine()
        }else{
            showEquipWeaponDialogForTerminalStringArray.append(voidString)
            showEquipWeaponDialogForTerminalStringArray.append(contentsOf: stringArrayHerosWhoCanEquipWeaponForTerminal(weapon: weapon))
            
            generateTerminalWindowWithSouls(topic: showEquipWeaponDialogForTerminalTopic, printArray: showEquipWeaponDialogForTerminalStringArray, in: terminalWidth)
            
            
            
            let chosenHero = chooseHero()//FromArray(array: herosWhoCanEquipWeapon)
            let currentWeapon = chosenHero.weapon
            if currentWeapon == nil{
                chosenHero.weapon = weapon
                addWeaponStats(hero: chosenHero, weapon: weapon, modifier: 1)
                let originIndexOfNewWeapon = self.weapons.firstIndex(where: {$0.name == weapon.name} )
                self.weapons[originIndexOfNewWeapon!].amount -= 1
            
                showEquipWeaponDialogForTerminalStringArray = []
                showEquipWeaponDialogForTerminalStringArray.append(voidString)
                showEquipWeaponDialogForTerminalStringArray.append(voidString)
                showEquipWeaponDialogForTerminalStringArray.append(voidString)
                showEquipWeaponDialogForTerminalStringArray.append("\(chosenHero.name) hat \(weapon.name) ausgerüstet!")
                showEquipWeaponDialogForTerminalStringArray.append(voidString)
                showEquipWeaponDialogForTerminalStringArray.append(enterString)
                
                generateTerminalWindowWithSoulAndCenterd(topic: showEquipWeaponDialogForTerminalTopic, printArray: showEquipWeaponDialogForTerminalStringArray, in: terminalWidth)
                
               _ = readLine()
            }else{
                let originIndexOfWeapon = self.weapons.firstIndex(where: {$0.name == currentWeapon!.name} )
                var originWeapon = self.weapons[originIndexOfWeapon!]
                originWeapon.amount += 1
                self.weapons[originIndexOfWeapon!] = originWeapon
                chosenHero.weapon = weapon
                let originIndexOfNewWeapon = self.weapons.firstIndex(where: {$0.name == weapon.name} )
                self.weapons[originIndexOfNewWeapon!].amount -= 1
                addWeaponStats(hero: chosenHero, weapon: originWeapon, modifier: -1)
                addWeaponStats(hero: chosenHero, weapon: weapon, modifier: 1)
                
                showEquipWeaponDialogForTerminalStringArray = []
                showEquipWeaponDialogForTerminalStringArray.append(voidString)
                showEquipWeaponDialogForTerminalStringArray.append(voidString)
                showEquipWeaponDialogForTerminalStringArray.append(voidString)
                showEquipWeaponDialogForTerminalStringArray.append("\(chosenHero.name) hat \(originWeapon.name) ins Inventar gelegt")
                showEquipWeaponDialogForTerminalStringArray.append("und \(weapon.name) ausgerüstet!")
                
                generateTerminalWindowWithSoulAndCenterd(topic: showEquipWeaponDialogForTerminalTopic, printArray: showEquipWeaponDialogForTerminalStringArray, in: terminalWidth)
            _ = readLine()
        }
        }
    }
    
    func printHerosWhoCanEquipWeapon(weapon: Weapon) -> [Hero]{
        
        let filteredHeroListForWeaponType = heroTeam.filter { $0.allowedWeaponTypes.contains(weapon.type) }
        for (i, hero) in filteredHeroListForWeaponType.enumerated(){
            print("\(i+1). \(hero.name)")
        }
        return filteredHeroListForWeaponType
    }
        
        func herosWhoCanEquipWeaponForTerminal(weapon: Weapon) -> [Hero]{
            
            let filteredHeroListForWeaponType = heroTeam.filter { $0.allowedWeaponTypes.contains(weapon.type) }
            /*for (i, hero) in filteredHeroListForWeaponType.enumerated(){
                print("\(i+1). \(hero.name)")
            }*/
            return filteredHeroListForWeaponType
        }
        
        func stringArrayHerosWhoCanEquipWeaponForTerminal(weapon: Weapon) -> [String]{
            var stringArrayHerosWhoCanEquipWeaponForTerminal: [String] = []
            let filteredHeroListForWeaponType = heroTeam.filter { $0.allowedWeaponTypes.contains(weapon.type) }
            for (i, hero) in filteredHeroListForWeaponType.enumerated(){
                stringArrayHerosWhoCanEquipWeaponForTerminal.append("[\(i+1)] \(hero.name)")
               
            }
            return stringArrayHerosWhoCanEquipWeaponForTerminal
        }
    
    
    func sellPotion(potion: Potion){
        print("Wie viele möchtest du von \(potion.name) (x\(potion.amount)) verkaufen?")
        let amountOfSalePotions: Int = readNumber()
        if amountOfSalePotions <= potion.amount{
            print("Du hast \(amountOfSalePotions) \(potion.name) für \(amountOfSalePotions * potion.sellPrice) verkauft!")
            souls += amountOfSalePotions * potion.sellPrice
            potion.amount -= amountOfSalePotions
        }else{
            print("Nicht genug Potions!")
        }
    }
    
    
    func sellPotionForTerminal(potion: Potion){
        let sellPotionTopic: String = "Verkaufen"
        var sellPotionStringArray: [String] = []
        sellPotionStringArray.append("Wie viele möchtest du von")
        sellPotionStringArray.append("\(potion.name) (x\(potion.amount)) verkaufen?")
        
        generateTerminalWindowWithSouls(topic: sellPotionTopic, printArray: sellPotionStringArray, in: terminalWidth)
        let amountOfSalePotions: Int = readNumber()
        
        if amountOfSalePotions <= potion.amount{
            souls += amountOfSalePotions * potion.sellPrice
            potion.amount -= amountOfSalePotions
            
            sellPotionStringArray.append(voidString)
            sellPotionStringArray.append(voidString)
            sellPotionStringArray.append("Du hast \(amountOfSalePotions) \(potion.name)")
            sellPotionStringArray.append("für \(amountOfSalePotions * potion.sellPrice) verkauft!")
            sellPotionStringArray.append(voidString)
            sellPotionStringArray.append("Du hast noch: \(potion.amount) \(potion.name)")
            sellPotionStringArray.append(voidString)
            sellPotionStringArray.append(enterString)
            
            generateTerminalWindowWithSouls(topic: sellPotionTopic, printArray: sellPotionStringArray, in: terminalWidth)
            _ = readLine()
            
        }else{
            sellPotionStringArray.append(voidString)
            sellPotionStringArray.append("Nicht genug Potions!")
            generateTerminalWindowWithSouls(topic: sellPotionTopic, printArray: sellPotionStringArray, in: terminalWidth)
            _ = readLine()
        }
    }

    
    func sellArmor(armor: inout Armor){
        print("Wie viele möchtest du von \(armor.name) (x\(armor.amount)) verkaufen?")
        let amountOfSaleArmors: Int = readNumber()
        if amountOfSaleArmors <= armor.amount{
            print("Du hast \(amountOfSaleArmors) \(armor.name) für \(amountOfSaleArmors * armor.sellPrice) verkauft! Drücke Enter für weiter!")
            souls += amountOfSaleArmors * armor.sellPrice
            
            let originIndexOfArmor = inventory.armors.firstIndex(where: {$0.name == armor.name} )
            
            inventory.armors[originIndexOfArmor!].amount -= amountOfSaleArmors
            //Hier hat es mit armor.amount einfach nicht geklappt.... nicht schön, aber funktioniert
            
            
            print("Du hast noch: \(inventory.armors[originIndexOfArmor!].amount) \(armor.name)")
            _ = readLine()
            
        }else{
            print("Nicht genug Rüstungen! Drücke Enter für weiter!")
            _ = readLine()
        }
    }
    
    func sellArmorForTerminal(armor: inout Armor){
        let sellArmorForTerminalTopic: String = "Verkaufen"
        var sellArmorForTerminalStringArray: [String] = []
        sellArmorForTerminalStringArray.append("Wie viele möchtest du von")
        sellArmorForTerminalStringArray.append("\(armor.name) (x\(armor.amount)) verkaufen?")
        
        generateTerminalWindowWithSouls(topic: sellArmorForTerminalTopic, printArray: sellArmorForTerminalStringArray, in: terminalWidth)
        
        let amountOfSaleArmors: Int = readNumber()
        
        if amountOfSaleArmors <= armor.amount{
            
            let originIndexOfArmor = inventory.armors.firstIndex(where: {$0.name == armor.name} )
            inventory.armors[originIndexOfArmor!].amount -= amountOfSaleArmors
            souls += amountOfSaleArmors * armor.sellPrice
            
            sellArmorForTerminalStringArray = []
            sellArmorForTerminalStringArray.append(voidString)
            sellArmorForTerminalStringArray.append(voidString)
            sellArmorForTerminalStringArray.append("Du hast \(amountOfSaleArmors) \(armor.name) verkauft")
            sellArmorForTerminalStringArray.append("für \(amountOfSaleArmors * armor.sellPrice) verkauft!")
            sellArmorForTerminalStringArray.append(voidString)
            sellArmorForTerminalStringArray.append("Du hast noch: \(inventory.armors[originIndexOfArmor!].amount) \(armor.name)")
            sellArmorForTerminalStringArray.append(voidString)
            sellArmorForTerminalStringArray.append(enterString)
            
            generateTerminalWindowWithSoulAndCenterd(topic: sellArmorForTerminalTopic, printArray: sellArmorForTerminalStringArray, in: terminalWidth)
            
            _ = readLine()
            
        }else{
            sellArmorForTerminalStringArray = []
            sellArmorForTerminalStringArray.append(voidString)
            sellArmorForTerminalStringArray.append(voidString)
            sellArmorForTerminalStringArray.append("Nicht genug Rüstungen!")
            sellArmorForTerminalStringArray.append(voidString)
            sellArmorForTerminalStringArray.append(enterString)
            
            generateTerminalWindowWithSoulAndCenterd(topic: sellArmorForTerminalTopic, printArray: sellArmorForTerminalStringArray, in: terminalWidth)
            _ = readLine()
        }
    }
    
    func sellWeapon(weapon: inout Weapon){
        print("Wie viele möchtest du von \(weapon.name) (x\(weapon.amount)) verkaufen?")
        let amountOfSaleWeapons: Int = readNumber()
        if amountOfSaleWeapons <= weapon.amount{
            print("Du hast \(amountOfSaleWeapons) \(weapon.name) für \(amountOfSaleWeapons * weapon.sellPrice) verkauft! Drücke Enter für weiter!")
            souls += amountOfSaleWeapons * weapon.sellPrice
            
            let originIndexOfWeapon = inventory.weapons.firstIndex(where: {$0.name == weapon.name} )
            
            inventory.weapons[originIndexOfWeapon!].amount -= amountOfSaleWeapons
            //Hier hat es mit armor.amount einfach nicht geklappt.... nicht schön, aber funktioniert
            
            
            print("Du hast noch: \(inventory.weapons[originIndexOfWeapon!].amount) \(weapon.name)")
            _ = readLine()
            
        }else{
            print("Nicht genug Waffen! Drücke Enter für weiter!")
            _ = readLine()
        }
    }
    
    func sellWeaponForTerminal(weapon: inout Weapon){
        let sellWeaponForTerminalTopic: String = "Verkaufen"
        var sellWeaponForTerminalStringArray: [String] = []
        sellWeaponForTerminalStringArray.append("Wie viele möchtest du von")
        sellWeaponForTerminalStringArray.append("\(weapon.name) (x\(weapon.amount)) verkaufen?")
        
        generateTerminalWindowWithSouls(topic: sellWeaponForTerminalTopic, printArray: sellWeaponForTerminalStringArray, in: terminalWidth)

        let amountOfSaleWeapons: Int = readNumber()
        if amountOfSaleWeapons <= weapon.amount{
            let originIndexOfWeapon = inventory.weapons.firstIndex(where: {$0.name == weapon.name})
            souls += amountOfSaleWeapons * weapon.sellPrice
            
            inventory.weapons[originIndexOfWeapon!].amount -= amountOfSaleWeapons
            sellWeaponForTerminalStringArray=[]
            sellWeaponForTerminalStringArray.append(voidString)
            sellWeaponForTerminalStringArray.append(voidString)
            sellWeaponForTerminalStringArray.append("Du hast \(amountOfSaleWeapons) \(weapon.name)")
            sellWeaponForTerminalStringArray.append("für \(amountOfSaleWeapons * weapon.sellPrice) verkauft!")
            sellWeaponForTerminalStringArray.append(voidString)
            sellWeaponForTerminalStringArray.append("Du hast noch: \(inventory.weapons[originIndexOfWeapon!].amount) \(weapon.name)")
            sellWeaponForTerminalStringArray.append(voidString)
            sellWeaponForTerminalStringArray.append(enterString)
            
            generateTerminalWindowWithSouls(topic: sellWeaponForTerminalTopic, printArray: sellWeaponForTerminalStringArray, in: terminalWidth)
            
          

            _ = readLine()
            
        }else{
            sellWeaponForTerminalStringArray = []
            sellWeaponForTerminalStringArray.append(voidString)
            sellWeaponForTerminalStringArray.append(voidString)
            sellWeaponForTerminalStringArray.append("Nicht genug Waffen!")
            sellWeaponForTerminalStringArray.append(voidString)
            sellWeaponForTerminalStringArray.append(enterString)
            
            generateTerminalWindowWithSoulAndCenterd(topic: sellWeaponForTerminalTopic, printArray: sellWeaponForTerminalStringArray, in: terminalWidth)
           
            _ = readLine()
        }
    }
    

    
}

let potionList: [Potion] = [
    potionSmall,
    potionMiddle,
    potionBig,
    holyPotion,
    atherSmall,
    atherMiddle,
    atherBig,
    holyAther
]
    
var armorList: [Armor] = [
    armorWood,
    armorIron,
    armorSteel,
    armorSilver,
    armorGold,
    armorMythril
    ]

var weaponList: [Weapon] = [
    sword1,
    swordAndShild1,
    axe1,
    dagger1,
    magicBracelet1,
    wand1,
    doppelDagger1,
    totem1,
    bow1,
    mace1,
    sword5,
    swordAndShild5,
    axe5,
    dagger5,
    magicBracelet5,
    wand5,
    doppelDagger5,
    totem5,
    bow5,
    mace5,
    legendSword,
    legendSwordAndShild,
    legendAxe,
    legendDagger,
    legendMagicBracelet,
    legendWand,
    legendDoppelDagger,
    legendTotem,
    legendBow,
    legendMace
]

var inventory: Inventory = Inventory(potions: potionList, armors: armorList, weapons: weaponList)



