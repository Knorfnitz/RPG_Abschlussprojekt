// Erweiterung String um auf Zahlen zu prüfen

extension String {
   var isNumber: Bool {
        return !isEmpty && range(of: "^[0-9]+$", options: .regularExpression) != nil
    } // Null würde an vielen Stellen Probleme bereiten
} // special thanks an autocompleation :D



