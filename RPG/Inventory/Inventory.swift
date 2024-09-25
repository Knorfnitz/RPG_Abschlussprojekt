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
        print("1. Potions\n2. Rüstungen\n3. Waffen")
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
        default:
            print("Falsche Eingabe")
        }
        
    }
    
    func showPotions(){
        printLine()
        print("Potions:")
        
        let filteredPotionList = potionList.filter { $0.amount > 0}
        
        for (i, potion) in filteredPotionList.enumerated() {
            print("\(i+1).\t\(potion.name)\tAnzahl: \(potion.amount)\tVerkaufspreis: \(potion.sellPrice)")
            print("Beschreibung: \(potion.description)")
            print()
            
        }
        if filteredPotionList.count > 0{
            print("Wähle ein Item")
            let choosePotionNr = readNumber()
            if choosePotionNr <= filteredPotionList.count{
                let choosenPotion = potions[choosePotionNr]
                print(choosenPotion.amount)
                waitForPotionActionAndDoChoosenAction(potion: choosenPotion)
              
            }
        }else{
            print("Keine Potions vorhanden")
        }
        printLine()
    }
    
    func showArmors(){
        printLine()
        print("Rüstungen:")
    }
    
    func showWeapons(){
        printLine()
        print("Waffen:")
    }
    
    
    func waitForPotionActionAndDoChoosenAction(potion: Potion){
        printRows(rows: 2)
        printLine()
        print(potion.name)
        print(potion.amount)
        print("Wähle eine Aktion:\n")
        print("1. Benutzen")
        print("2. Verkaufen")
        printLine()
        
        let choosenAction = readNumber()
        switch choosenAction{
        case 1:
            usePotion(potion: potion)
        case 2:
            sellPotion(potion: potion)
        default:
            print("Falsche Eingabe")
        }
    }
    
    func printHeroTeamForItems(){
        for (i, hero) in heroTeam.enumerated(){
    
            print("\(i+1).  \(hero.name)\t HP: (\(hero.hp)/\(hero.fullHp))\t MP: (\(hero.mp)/\(hero.fullMp))\t")
            
        }
    }
    
    func usePotion(potion: Potion){
        print("Bei wem möchtest du \(potion.name) benutzen?\n")
        printHeroTeamForItems()
        let chooseHero = readNumber()
        if chooseHero <= heroTeam.count{
            heroTeam[chooseHero-1].hp += potion.amountOfHeal
        }
    }
    func sellPotion(potion: Potion){
        print("Wie viele möchtest du von \(potion.name) (x\(potion.amount)verkaufen?")
        let amountOfSalePotions: Int = readNumber()
        if amountOfSalePotions <= potion.amount{
            print("Du hast \(amountOfSalePotions) \(potion.name) für \(amountOfSalePotions * potion.sellPrice) verkauft!")
            souls += amountOfSalePotions * potion.sellPrice
            potion.amount -= amountOfSalePotions
        }else{
            print("Nicht genug Potions!")
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
    
let armorList: [Armor] = [
    armorWood,
    armorIron,
    armorSteel,
    armorSilver,
    armorGold,
    armorMythril
    ]

let weaponList: [Weapon] = [
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

let inventory: Inventory = Inventory(potions: potionList, armors: armorList, weapons: weaponList)
