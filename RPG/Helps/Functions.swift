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

func addCharacter(){
    
}

func checkNumber(){
    
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

func showcampMenu()-> String{
    printLine()
 //   printRows(rows: 2)
    print("Lager:\n")
    print("1. Team\n2. Inventar\n3. Heilen\n4. Shop\n5. Kampf")
    
    printCurrentTeam(heros: heroTeam)
  //  printRows(rows: 1)
    print("\t\t\t\t\t\t\t\t\t\t\t\tSeelen: \(souls)")
    printLine()
    print("Wähle ein Menuepunkt:")
    print()
    menue = readLine()
    return menue!
}


func printCurrentTeam(heros: [Hero]){
    print("\naktuelles Team:")
    for (i, heros) in heros.enumerated(){
        print("\(i+1): \(heros.name) Level: \(heros.lvl) HP: \(heros.hp)/\(heros.fullHp) MP: \(heros.mp)/\(heros.fullMp) STR: \(heros.str) DEF: \(heros.def) INT: \(heros.int) DEX:\(heros.dex)")
    }
}
