
import Foundation


let maincolor = red
let backgroundcolor = white
let aktivcolor = "\u{001B}[32m"
let voidString = "      "



func startScreen(terminal: Int){
 if terminal == 0 {
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

    }
    if terminal == 1 {
        clearScreen()
        print("""
    \(maincolor)
    ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
    """)
        clearScreenAndWait(2.0)
        print("""
    
    ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
    ⬛️                            ####      ##  ##    ####   #######                              ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
    """)
        clearScreenAndWait(0.3)
        print("""
    
    ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
    ⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
    ⬛️                            ####      ##  ##    ####   #######                              ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
    """)
        
        clearScreenAndWait(0.3)
        print("""
    
    ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
    ⬛️                             ##       ##  ##     ##     ##                                  ⬛️
    ⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
    ⬛️                            ####      ##  ##    ####   #######                              ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️                                                                                            ⬛️
    ⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
    """)
    }
    
    clearScreenAndWait(0.3)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")
    
    clearScreenAndWait(0.3)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")

    clearScreenAndWait(0.3)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                             ##  ##    ####   #  ##  #  ##  ##                              ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")

    clearScreenAndWait(0.3)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                             ######     ##    ######## #######                              ⬛️
⬛️                             ##  ##    ####   #  ##  #  ##  ##                              ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")

    clearScreenAndWait(0.3)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                                                                                            ⬛️
⬛️                             ######     ##    ######## #######                              ⬛️
⬛️                             ##  ##    ####   #  ##  #  ##  ##                              ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")
    
    
    clearScreenAndWait(0.3)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                             ######     ##    ######## #######                              ⬛️
⬛️                             ##  ##    ####   #  ##  #  ##  ##                              ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")
    
    clearScreenAndWait(0.3)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                             ######     ##    ######## #######                              ⬛️
⬛️                             ##  ##    ####   #  ##  #  ##  ##                              ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")
    
    
    clearScreenAndWait(0.3)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                             ######     ##    ######## #######                              ⬛️
⬛️                             ##  ##    ####   #  ##  #  ##  ##                              ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")
    
    clearScreenAndWait(1.0)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                             ######     ##    ######## #######                              ⬛️
⬛️                             ##  ##    ####   #  ##  #  ##  ##                              ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                 Drücke Enter zum starten                                   ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")
    
    clearScreenAndWait(1.0)
    print("""

⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                             ######     ##    ######## #######                              ⬛️
⬛️                             ##  ##    ####   #  ##  #  ##  ##                              ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ####     ######     ##     ####                                ⬛️
⬛️                             ##       ##  ##     ##     ##                                  ⬛️
⬛️                             ##       ##  ##     ##     ##  ##                              ⬛️
⬛️                            ####      ##  ##    ####   #######                              ⬛️
⬛️                                                                                            ⬛️
⬛️                                \(blink) Drücke Enter zum starten \(reset) \(red)                                 ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                                            ⬛️
⬛️                                                                Danke Maik K. =)            ⬛️
⬛️                                                                                            ⬛️
⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️
""")
    
    }
    
func choseStartCharacterWindow(terminal: Int) -> String{
    if terminal == 0 {
        print("""
*************************************************************************
*                                                                       *
*                      Wähle deinen Start-Helden:                       *
*                                                                       *
*                           1. Krieger Kirito                           *
*                           2. Druide Radagast                          *
*                           3. Waldläufer Aragorn                       *
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
        
        let heroNumber = readLine()!
        
        return heroNumber
    }
    
    if terminal == 1 {
        clearScreen()
        
    let Heronames = [voidString, "[1] Kirito", "[2] Radagast", "[3] Aragorn", "[4] Shion", "[5] Milim", "[6] Rias"]
        fadeoutWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)
        
        generateTerminalWindow(topic: "Wähle einen Helden:", printArray: Heronames, in: terminalWidth)
        
        let heroNumber = readLine()!
        fadeinWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)
    
        return heroNumber

    }
    return ""
}

func soulString( in width: Int) -> String {
    let soulsString: String = "Seelen: " + String(souls)
    let padding: Int = (width - soulsString.count) / 2
        var paddingAfter: Int = 0
        
            if soulsString.count % 2 == 0 {
            paddingAfter = padding - 2
        }else{
            paddingAfter = padding - 1
        }
        
        
    return "⬛️" + String(repeating: " ", count: padding) + String(repeating: " ", count: paddingAfter) + soulsString + "  " + "⬛️"
    
}




func centerString(_ string: String, in width: Int) -> String {
  /* if string.count <= 1 {
        return "⬛️" + String (repeating: " ", count: width / 2 - 1) + string + String(repeating: " ", count: width) + "⬛️"
    }else{
   */
        let padding: Int = (width - string.count) / 2
        var paddingAfter: Int = 0
        
        if string.count % 2 == 0 {
            paddingAfter = padding
        }else{
            paddingAfter = padding + 1
        }
        
        
        return "⬛️" + String (repeating: " ", count: padding) + string + String(repeating: " ", count: paddingAfter) + "⬛️"
    
}

func centerStringArray(_ strings: [String], in width: Int) -> [String] {
    var maxStringCount: Int = 0
    
    for string in strings {
        if string.count > maxStringCount {
            maxStringCount = string.count
        }
    }
    
        let paddingLeft = (width - maxStringCount) / 2
        var paddingRight: Int = 0
        var stringArrayWithPadding: [String] = []
    
        for string in strings {
          
                paddingRight = width - string.count - paddingLeft
            
            stringArrayWithPadding.append("⬛️" + String(repeating: " ", count: paddingLeft) + string + String(repeating: " ", count: paddingRight) + "⬛️")
        }
        return stringArrayWithPadding
        
    }

func printStringArray(_ strings: [String] )-> Int{
    let count: Int = strings.count
    for string in strings{
        print(string)
    }
    return count
}

func printTerminalLine() -> Int{
    print("⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️⬛️")
    return 1
}
func printTerminalEmptyLine() -> Int{
    print("⬛️                                                                                            ⬛️")
    return 1
}

func printMutipleTerminalEmptyLines(lines: Int) -> Int{
    let emptyLineCount = lines
    for _ in 0..<emptyLineCount{
       _ = printTerminalEmptyLine()
    }
    return emptyLineCount
}

func generateTerminalWindow(topic: String, printArray: [String], in width: Int){
    clearScreen()
    var rowCount: Int = 0
    rowCount += printTerminalLine()
    rowCount += printTerminalEmptyLine()
    
    if !topic.isEmpty{
        print("\(bold)\(centerString(topic, in: width))\(reset)\(maincolor)")
        rowCount += 1
        rowCount += printTerminalEmptyLine()
    }
    
    let newArray: [String] = centerStringArray(printArray, in: width)
        rowCount += printStringArray(newArray)
    
    
    while rowCount < 21{
        rowCount += printTerminalEmptyLine()
    }
    _ = printTerminalLine()
    
}

func generateTerminalWindowWithSouls(topic: String, printArray: [String], in width: Int){
    clearScreen()
    var rowCount: Int = 0
    rowCount += printTerminalLine()
    print(soulString(in: width))
    rowCount += 1
    
    if !topic.isEmpty{
        print("\(bold)\(centerString(topic, in: width))\(reset)\(maincolor)")
        rowCount += 1
        rowCount += printTerminalEmptyLine()
    }
    
    let newArray: [String] = centerStringArray(printArray, in: width)
        rowCount += printStringArray(newArray)
    
    
    while rowCount < 21{
        rowCount += printTerminalEmptyLine()
    }
    _ = printTerminalLine()
    
}
func generateTerminalWindowWithSoulAndCenterd(topic: String, printArray: [String], in width: Int){
    clearScreen()
    var rowCount: Int = 0
    rowCount += printTerminalLine()
    print(soulString(in: width))
    rowCount += 1
    
    if !topic.isEmpty{
        print("\(bold)\(centerString(topic, in: width))\(reset)\(maincolor)")
        rowCount += 1
        rowCount += printTerminalEmptyLine()
    }
    for string in printArray{
        print("\(centerString(string, in: width))")
        rowCount += 1
    
    }
    
    while rowCount < 21{
        rowCount += printTerminalEmptyLine()
    }
    _ = printTerminalLine()
    
}


func choseStartCharacter(terminal: Int, hero: String){
    
if terminal == 0{
    let isEnded: Bool = false
    var input: String = String(hero)
    
    while !isEnded{
        
        switch input {
        case "0":
            

            input = readLine()!
            
        case "1":
            kirito.printDetails()
            print("Kirito wurde gewählt.")
            print("\nIst das richtige?")
            print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
            
            input = confirm(readLine()!)
            if input == ""{
                heroTeam.append(kirito)
                
                availableHerosForBuy.append(radagast)
                availableHerosForBuy.append(aragorn)
                availableHerosForBuy.append(shion)
                availableHerosForBuy.append(milim)
                availableHerosForBuy.append(rias)
                
            }
        case "2":
            radagast.printDetails()
            print("Radagast wurde gewählt.")
            print("\nIst das richtige?")
            print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
            input = confirm(readLine()!)
            if input == ""{
                heroTeam.append(radagast)
                
                availableHerosForBuy.append(kirito)
                availableHerosForBuy.append(aragorn)
                availableHerosForBuy.append(shion)
                availableHerosForBuy.append(milim)
                availableHerosForBuy.append(rias)
                
            }
            
        case "3":
            aragorn.printDetails()
            print("Aragorn wurde gewählt.")
            print("\nIst das richtige?")
            print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
            input = confirm(readLine()!)
            if input == ""{
                heroTeam.append(aragorn)
                
                availableHerosForBuy.append(kirito)
                availableHerosForBuy.append(radagast)
                availableHerosForBuy.append(shion)
                availableHerosForBuy.append(milim)
                availableHerosForBuy.append(rias)
                
            }
            
        case "4":
            shion.printDetails()
            print("Shion wurde gewählt.")
            print("\nIst das richtige?")
            print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
            input = confirm(readLine()!)
            if input == ""{
                heroTeam.append(shion)
                
                availableHerosForBuy.append(kirito)
                availableHerosForBuy.append(radagast)
                availableHerosForBuy.append(aragorn)
                availableHerosForBuy.append(milim)
                availableHerosForBuy.append(rias)
                
            }
        case "5":
            milim.printDetails()
            print("Milim wurde gewählt.")
            print("\nIst das richtige?")
            print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
            input = confirm(readLine()!)
            if input == ""{
                heroTeam.append(milim)
                
                availableHerosForBuy.append(kirito)
                availableHerosForBuy.append(radagast)
                availableHerosForBuy.append(aragorn)
                availableHerosForBuy.append(shion)
                availableHerosForBuy.append(rias)
                
            }
            
        case "6":
            rias.printDetails()
            print("Rias wurde gewählt.")
            print("\nIst das richtige?")
            print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
            input = confirm(readLine()!)
            if input == ""{
                heroTeam.append(rias)
                
                availableHerosForBuy.append(kirito)
                availableHerosForBuy.append(radagast)
                availableHerosForBuy.append(aragorn)
                availableHerosForBuy.append(shion)
                availableHerosForBuy.append(milim)
                
            }
            
        case "99":
            print("Du bist ein Cheater...\n")
            
            print("\nDir wird das ultimative Team zur verfügung gestellt...")
            
            print("\nDein Lager wird gefüllt...")
            print("Weiter mit Enter... oder Abbrechen mit belibiger Eingabe.")
            input = confirm(readLine()!)
            if input == ""{
                createCheatTeam()
            }
        default:
            print("Falsche Eingabe...")
            input = "0"
        }
    }
    }
    
    if terminal == 1{
        
        clearScreen()
        
        //var isEnded: Bool = false
        var input: String = String(hero)
        
        while !isEnded{
            
            switch input {
            case "0":
                
                input = choseStartCharacterWindow(terminal: GlobalTerminal)
                
            case "1":
                kirito.printDetailsforTerminal()
                input = confirm(readLine()!)
                if input == ""{
                    heroTeam.append(kirito)
                    
                    availableHerosForBuy.append(radagast)
                    availableHerosForBuy.append(aragorn)
                    availableHerosForBuy.append(shion)
                    availableHerosForBuy.append(milim)
                    availableHerosForBuy.append(rias)
                   
                }
            case "2":
                radagast.printDetailsforTerminal()
                input = confirm(readLine()!)
                if input == ""{
                    heroTeam.append(radagast)
                    
                    availableHerosForBuy.append(kirito)
                    availableHerosForBuy.append(aragorn)
                    availableHerosForBuy.append(shion)
                    availableHerosForBuy.append(milim)
                    availableHerosForBuy.append(rias)
                    
                }
                
            case "3":
                aragorn.printDetailsforTerminal()
                input = confirm(readLine()!)
                if input == ""{
                    heroTeam.append(aragorn)
                    
                    availableHerosForBuy.append(kirito)
                    availableHerosForBuy.append(radagast)
                    availableHerosForBuy.append(shion)
                    availableHerosForBuy.append(milim)
                    availableHerosForBuy.append(rias)
                    
                }
                
            case "4":
                shion.printDetailsforTerminal()
                input = confirm(readLine()!)
                if input == ""{
                    heroTeam.append(shion)
                    
                    availableHerosForBuy.append(kirito)
                    availableHerosForBuy.append(radagast)
                    availableHerosForBuy.append(aragorn)
                    availableHerosForBuy.append(milim)
                    availableHerosForBuy.append(rias)
                    
                }
            case "5":
                milim.printDetailsforTerminal()
                input = confirm(readLine()!)
                if input == ""{
                    heroTeam.append(milim)
                    
                    availableHerosForBuy.append(kirito)
                    availableHerosForBuy.append(radagast)
                    availableHerosForBuy.append(aragorn)
                    availableHerosForBuy.append(shion)
                    availableHerosForBuy.append(rias)
                    
                }
                
            case "6":
                rias.printDetailsforTerminal()
                input = confirm(readLine()!)
                if input == ""{
                    heroTeam.append(rias)
                    
                    availableHerosForBuy.append(kirito)
                    availableHerosForBuy.append(radagast)
                    availableHerosForBuy.append(aragorn)
                    availableHerosForBuy.append(shion)
                    availableHerosForBuy.append(milim)
                    
                }
                
            case "99":
                let cheatCharacterStringArray: [String] = ["\(voidString)",
                                                          "Du bist ein Cheater...",
                                                          "\(voidString)",
                                                          "Dir wird das ultimative Team ",
                                                          "zur verfügung gestellt...",
                                                          "\(voidString)",
                                                          "Dein Lager wird gefüllt...",
                                                          "\(voidString)",
                                                          "\(voidString)",
                                                          "Weiter mit Enter...",
                                                          "oder Abbrechen mit belibiger Eingabe."]
                fadeoutWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)
                       generateTerminalWindow(topic: voidString, printArray: cheatCharacterStringArray, in: terminalWidth)
                input = confirm(readLine()!)
                fadeinWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)
                if input == ""{
                    createCheatTeam()
                }
                
            default:
                print("Falsche Eingabe...")
            
                input = choseStartCharacterWindow(terminal: GlobalTerminal)
            }
        }
        }
}


func campMenu(terminal: Int){
    if terminal == 0{
        
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
    }
    
    if terminal == 1{
        
        var menue: String? = "0"
        isEnded = false
        
        while !isEnded{
            switch menue {
            case "0":
                fadeinWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)
                fadeoutWindow(height: terminalHeight, width: terminalWidth, speed: frequenz)
                menue = showCampMenuForTerminal()
           
                
            case "1":
                let newHeroOrder: [Hero] = swapHeroTeamForTerminal(heros: heroTeam)
                heroTeam = newHeroOrder

                menue = "0"
            case "2":
                inventory.showInventoryForTerminal()
                menue = "0"
            case "3":
                healGroupForTerminal()
                menue = "0"
            case "4":
                levelUpForTerminal(hero: chooseHeroForLevelUpForTerminal(heros: heroTeam))
                menue = "0"
            case "5":
                startLevelForTerminal()
                menue = "0"
            case "6":
                shop.showShopForTerminal()
                menue = "0"
                
            default:
                menue = "0"
                
            }
        }
    }
}


func battleScreen(topic: String,actionMessage: [String], enemies: [String], heros: [String], in width: Int) {
    clearScreen()
    var rowCount: Int = 0
   // let screenCenter: Int = width / 2
    
    rowCount += printTerminalLine()
    // Überschrift 2 Zeilen
    if !topic.isEmpty{
        print("\(bold)\(centerString(topic, in: width))\(reset)\(maincolor)")
        rowCount += 1
       //rowCount += printTerminalEmptyLine()
    }
    //Mitte Rechts bis zu 3 Gegner
    let enemiesArray: [String] = leftStringArrayStartCenter(enemies, in: width)

    for line in enemiesArray{
        print(line)
        rowCount += 1
    }

   switch enemiesArray.count {
   case 1:
       rowCount += printTerminalEmptyLine()
       rowCount += printTerminalEmptyLine()
   case 2:
       rowCount += printTerminalEmptyLine()
   case 3:
       rowCount += 0
   default:
       print("Kann nicht sein")
    }
    rowCount += printTerminalEmptyLine()
    rowCount += printTerminalEmptyLine()
    rowCount += printTerminalEmptyLine()
    
    for line in actionMessage{
        print(centerString(line, in: terminalWidth))
        rowCount += 1
    }
    
    while rowCount < 17{
        rowCount += printTerminalEmptyLine()
    }
    let newArray: [String] = twoRowsStringArrayWithActionMenu(stringsRight: heros, in: terminalWidth)
        
    
    _ = printStringArray(newArray)
    
   
    _ = printTerminalEmptyLine()
    _ = printTerminalLine()
}


func leftStringArrayStartCenter(_ strings: [String], in width: Int) -> [String] {
    
        let paddingLeft = (width / 2) + 5
        var paddingRight: Int = 0
        var stringArrayWithPadding: [String] = []
    
        for string in strings {
          
                paddingRight = width - string.count - paddingLeft
            
            stringArrayWithPadding.append("⬛️" + String(repeating: " ", count: paddingLeft) + string + String(repeating: " ", count: paddingRight - 1) + "⬛️") // -1 für emoji count
        }
        return stringArrayWithPadding
        
    }

func twoRowsStringArrayWithActionMenu(stringsRight: [String], in width: Int) -> [String] {
    let actionMenu: [String] = [
        "[1] Attacke",
        "[2] Spezialattacke",
        "[3] Beutel"
        ]
    var rightStringArray: [String] = []
    
    let paddingLeft = 2
    var paddingMiddle: Int = 0
    var paddingRight: Int = 0
    var stringArrayWithPadding: [String] = []

    switch stringsRight.count {
        case 1:
            rightStringArray.append(stringsRight[0])
            rightStringArray.append(voidString)
            rightStringArray.append(voidString)
        case 2:
            rightStringArray.append(stringsRight[0])
            rightStringArray.append(stringsRight[1])
            rightStringArray.append(voidString)
        case 3:
            rightStringArray.append(stringsRight[0])
            rightStringArray.append(stringsRight[1])
            rightStringArray.append(stringsRight[2])
        default:
            print("Kann nicht sein")
        }

    for (i, string) in actionMenu.enumerated() {
        //zum Punkt breite/2 + 2 = paddingLeft + string + x
        paddingMiddle =  ((width/2) - 10) - string.count - paddingLeft
        //Restpadding x = breite - paddingLeft - stringLeft - paddingMitte - stringRight +1 für emoji count
        paddingRight = width - paddingLeft - string.count - paddingMiddle - rightStringArray[i].count
        
        stringArrayWithPadding.append("⬛️" + String(repeating: " ", count: paddingLeft) + string + String(repeating: " ", count: paddingMiddle) + rightStringArray[i] + String(repeating: " ", count: paddingRight) + "⬛️")
    }
    return stringArrayWithPadding
    
}

func fadeoutWindow(height h: Int, width w: Int, speed: Double){
    let borderEmoji = "⬛️"  // Du kannst hier jedes Emoji einsetzen
        let emptySpace = "  "  // Leerzeichen für den inneren Bereich, doppelt so breit
        
        // Berechne die Mitte des Fensters
        let centerX = w / 2
        let centerY = h / 2
        
        var currentWidth = 4  // Startbreite (doppelte Zeichen zählen als 2)
        var currentHeight = 2  // Starthöhe
        
        while currentWidth <= w {
            // Berechne den Startpunkt für die aktuelle Rechteckgröße
            let startX = max(centerX - currentWidth / 2, 0)
            let startY = max(centerY - currentHeight / 2, 0)
            
            // Ausgabe für jede Zeile des Rechtecks
            for y in 0..<h {
                if y >= startY && y < startY + currentHeight {
                    if y == startY || y == startY + currentHeight - 1 {
                        // Obere und untere Zeilen komplett mit Emoji (Rahmen)
                        let row = String(repeating: " ", count: startX) + String(repeating: borderEmoji, count: currentWidth / 2)
                        print(row)
                    } else {
                        // Innenräume mit Leerzeichen und Emoji-Rahmen an den Seiten
                        let row = String(repeating: " ", count: startX) + borderEmoji + String(repeating: emptySpace, count: (currentWidth - 4) / 2) + borderEmoji
                        print(row)
                    }
                } else {
                    // Leere Zeile außerhalb des Rechtecks
                    print(String(repeating: " ", count: w))
                }
            }
            
            // Vergrößere das Rechteck
            currentWidth += 4  // Breite erhöht sich weiterhin
            if currentHeight < h {
                currentHeight += 2  // Höhe erhöht sich nur bis zur maximalen Höhe
            }
            
           
            clearScreenAndWait(speed)
        }
  
}


func fadeinWindow(height h: Int, width w: Int, speed: Double) {
    // Emoji-Zeichen für die Rahmen
    let borderEmoji = "⬛️"  // Du kannst hier jedes Emoji einsetzen
    let emptySpace = "  "   // Leerzeichen für den inneren Bereich, doppelt so breit
    
    var currentWidth = w    // Startbreite
    var currentHeight = h   // Starthöhe
    
    while currentWidth > 2 && currentHeight > 2 {
        // Berechne den Startpunkt für die aktuelle Rechteckgröße
        let centerX = w / 2
        let centerY = h / 2
        let startX = max(centerX - currentWidth / 2, 0)
        let startY = max(centerY - currentHeight / 2, 0)
        
        // Ausgabe für jede Zeile des Rechtecks
        for y in 0..<h {
            if y >= startY && y < startY + currentHeight {
                if y == startY || y == startY + currentHeight - 1 {
                    // Obere und untere Zeilen komplett mit Emoji (Rahmen)
                    let row = String(repeating: " ", count: startX) + String(repeating: borderEmoji, count: currentWidth / 2)
                    print(row)
                } else {
                    // Innenräume mit Leerzeichen und Emoji-Rahmen an den Seiten
                    let row = String(repeating: " ", count: startX) + borderEmoji + String(repeating: emptySpace, count: (currentWidth - 4) / 2) + borderEmoji
                    print(row)
                }
            } else {
                // Leere Zeile außerhalb des Rechtecks
                print(String(repeating: " ", count: w))
            }
        }
        
        // Verkleinere das Rechteck
        currentWidth -= 4  // Reduziere die Breite um 4 Zeichen (wegen Emoji)
        currentHeight -= 2 // Reduziere die Höhe um 2 Zeilen
        
        clearScreenAndWait(speed)
    }
}
