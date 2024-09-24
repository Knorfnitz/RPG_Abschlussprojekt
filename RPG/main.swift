import Foundation

//Grundlegende Variablen

var souls: Int = 200
var team: [Hero] = []
var enemieTeam: [Enemie] = []

// Tests:


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

waterSlime.printDetails()
waterSlime.increaseLvl(5)
waterSlime.printDetails()

let string1 = "Hello World"
let string2 = "01234"
let string3 = "01t"
print(string1.isNumber)
print(string2.isNumber)
print(string3.isNumber) 



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
        team.append(kirito)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "2":
        radagast.printDetails()
        print("Radagast wurde gewählt.")
        //character1 = radagast
        team.append(radagast)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "3":
        aragorn.printDetails()
        print("Aragorn wurde gewählt.")
        //character1 = aragorn
        team.append(aragorn)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "4":
        shion.printDetails()
        print("Shion wurde gewählt.")
        //character1 = shion
        team.append(shion)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "5":
        milim.printDetails()
        print("Shion wurde gewählt.")
        //character1 = milim
        team.append(milim)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    case "6":
        rias.printDetails()
        print("Rias wurde gewählt.")
        //character1 = rias
        team.append(rias)
        print("\nIst das richtige?")
        print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
        input = confirm(readLine()!)
        
    default:
        print("Falsche Eingabe...")
    }
}

var menue: String? = "0"
isEnded = false

while !isEnded{
    switch menue {
    case "0":
        print("""
        ****************************************************************************************
        *                                                    
        *                                     Lager:                   
        *                                                
        *                                      1. Team              
        *                                      2. Inventar           
        *                                      3. Shop               
        *                                      4. Alle heilen (_ Seelen)        
        *                                      5. Kampf                            
        *                                                  
        *\taktuelles Team:                              
        *\t\(team[0].name)\t Level:\(team[0].lvl)\t HP:\(team[0].fullHp)\t MP:\(team[0].fullHp)\t Stärke:\(team[0].str)\t Vert.:\(team[0].def)\t Int.:\(team[0].int)\t Gesch.:\(team[0].dex)
        *  
        *                                                               
        *                                                                Seelen:\t \(souls)       
        ****************************************************************************************
        """)
        




        print("Wähle ein Menuepunkt:")
        print()
        menue = readLine()!
       
        
    case "1":
        print()
        
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "2":
        print()

        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "3":
        print()

        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "4":
        print()

        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "5":
        print()
  
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
    case "7":
        print()
    
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "8":
        print()

        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "9":
        print()

        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "10":
        print()
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "11":
        print()
        print()
        print("Weiter mit Enter!")
        _ = readLine()
        menue = "0"
    case "12":
        print()
        print("Das Programm wird beendet")
        sleep(3)
        exit(0)
    default:
        print()
        print("Eingabe nicht verfügbar, du wirst zum Hauptmenü weitergeleitet")
        sleep(2)
        menue = "0"
        
    }
}
