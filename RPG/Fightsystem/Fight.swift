import Foundation

var maxLvl: Int = 1

func showLvl(){
    print("""
   *************************************************************************
                                            
                      Wähle eine Ebene:                       
                      Deine maximale Ebene ist: \(maxLvl)          
                                                        
                                
                       
                                        
                       
                   
                       
                    
                                   
                                                                
                                                            
   *************************************************************************
   """)
    
    // Eingabe auf Zahl prüfen und ob die Ebene freigeschaltet ist
    
    if let input = readLine() {
        let isNumbers = input.allSatisfy { $0.isNumber }
        
        if isNumbers {
            if Int(input)! <= maxLvl{
                //geh zum kampf
                gotoFight(heros: team, enemies: enemieTeam)
            }else{
                print("das level ist noch nicht verfügbar")
            }
        }else{
            print("Falsche Eingabe")
        }
    }
}


func gotoFight(heros h:[Hero],enemies e:[Enemie]){
    for hero in h{
        if e.count > 1{
            print("Welchen Gegner möchtest du angreifen")
            let target: String = readLine()!
            
        }else{
            
        }
    }
}

func createEnemie(){
    
}

func fight(){
    
}
