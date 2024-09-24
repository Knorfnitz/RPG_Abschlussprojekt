// Erweiterung String um auf Zahlen zu prüfen

extension String {
    var isNumber: Bool {
        return !isEmpty && range(of: "^[0-9]+$", options: .regularExpression) != nil
    }
}
