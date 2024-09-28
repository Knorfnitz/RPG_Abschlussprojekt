

import Foundation

// ANSI-Escape-Sequenzen für verschiedene Textattribute
let reset = "\u{001B}[0m"           // Zurücksetzen von Farben und Attributen
let bold = "\u{001B}[1m"            // Fett
let thin = "\u{001B}[2m"            // Dünn (light)
let italic = "\u{001B}[3m"          // Kursiv
let underline = "\u{001B}[4m"       // Unterstrichen
let blink = "\u{001B}[5m"           // Blinkend
let dummy = "\u{001B}[6m"           // Dummy
let inverse = "\u{001B}[7m"         // Inverse
let hidden = "\u{001B}[8m"          // Versteckt
let strikethrough = "\u{001B}[9m"   // Durchgestrichen
let black = "\u{001B}[30m"          // Schwarz
let red = "\u{001B}[31m"            // Rot
let green = "\u{001B}[32m"          // Gruen
let yellow = "\u{001B}[33m"         // Gelb
let blue = "\u{001B}[34m"           // Blau
let magenta = "\u{001B}[35m"        // Magenta
let cyan = "\u{001B}[36m"           // Cyan
let white = "\u{001B}[37m"          // White



// Funktion zum Generieren einer ANSI-Sequenz für eine bestimmte Vordergrund- und Hintergrundfarbe
func ansiColor(foreground: Int, background: Int) -> String {
    return "\u{001B}[38;5;\(foreground)m\u{001B}[48;5;\(background)m"
}

// ANSI-Farbcodes (0-255)
let colors = (0...512).map { $0 }

// Funktion zur Anzeige der ANSI-Farbtabelle mit allen Attributen
func printAnsiColorTable() {
    let columns = 24  // Anzahl der Spalten in der Tabelle
    let rows = colors.count / columns  // Anzahl der Zeilen
    
    print("ANSI Color Table with Attributes (Foreground + Background):")
    for row in 0..<rows {
        for col in 0..<columns {
            let fgColor = colors[row * columns + col]
            let bgColor = (fgColor + 128) % 256 // Hintergrundfarbe variieren, um Kontrast zu schaffen
            let colorCode = ansiColor(foreground: fgColor, background: bgColor)
            let text = String(format: "%3d", fgColor)
            
            // Textattribute (fett, dünn, kursiv, unterstrichen, blinkend)
            let attributes = [bold, thin, italic, underline, blink, dummy, inverse, hidden, strikethrough, black, red, green, yellow, blue, magenta, cyan, white]
            let attributeText = attributes.randomElement() ?? ""
            
            // Farbkombination und Attribute ausgeben
            print("\(colorCode)\(attributeText)\(text)\(reset)", terminator: " ")
        }
        print("") // Neue Zeile nach jeder Tabellenreihe
    }
}

// Bildschirm leeren
func clearScreen() {
    if GlobalTerminal == 1{
        print("\u{001B}[2J")
    }
}

func clearScreenAndWait(_ wait: Double) {
    if GlobalTerminal == 1{
        Thread.sleep(forTimeInterval: wait)
        print("\u{001B}[2J")
    }
}

// Cursor an den Anfang des Bildschirms setzen
func moveToTop() {
    print("\u{001B}[H")
}

