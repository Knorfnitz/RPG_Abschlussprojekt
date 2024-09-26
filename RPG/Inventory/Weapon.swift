struct Weapon{
    let name: String
    let type: WeaponType
    var extraHP: Int
    var extraMP: Int
    var extraSTR: Int
    var extraDEF: Int
    var extraINT: Int
    var extraDEX: Int
    var element: Element
    var amount: Int = 0
    let level: Int
    var sellPrice: Int
    
    init(name: String, type: WeaponType, extraHP: Int, extraMP: Int, extraSTR: Int, extraDEF: Int, extraINT: Int, extraDEX: Int, element: Element, level: Int) {
        self.name = name
        self.type = type
        self.extraHP = extraHP
        self.extraMP = extraMP
        self.extraSTR = extraSTR
        self.extraDEF = extraDEF
        self.extraINT = extraINT
        self.extraDEX = extraDEX
        self.element = element
        self.level = level
        self.sellPrice = level * 500
    }
    
    mutating func increaseAmount(amount: Int){
        self.amount += amount
    }
}

