class Potion: Item {
    let potionType: Int
    let amountOfHeal:Int
    
    init (name: String, price: Int, potionTyp: Int, amonthOfHeal: Int, description: String) {
        self.potionType = potionTyp
        self.amountOfHeal = amonthOfHeal
        super.init(name: name, price: price, description: description)
    }
    
    func usePotion(hero: Hero){
        switch potionType {
        case 1: hero.hp += 200
            if hero.hp > hero.fullHp { hero.hp = hero.fullHp }
            print("\(hero.name) hat sich mit einer Potion auf \(hero.hp) HP geheilt")
        case 2: hero.hp += 500
            if hero.hp > hero.fullHp { hero.hp = hero.fullHp }
            print("\(hero.name) hat sich mit einer Potion auf \(hero.hp) HP geheilt")
        case 3: hero.hp += 1000
            if hero.hp > hero.fullHp { hero.hp = hero.fullHp }
            print("\(hero.name) hat sich mit einer Potion auf \(hero.hp) HP geheilt")
        case 11: hero.mp += 20
            if hero.mp > hero.fullHp { hero.mp = hero.fullMp }
            print("\(hero.name) hat sich mit einer Potion auf \(hero.mp) MP geheilt")
        case 12: hero.mp += 50
            if hero.mp > hero.fullHp { hero.mp = hero.fullMp }
            print("\(hero.name) hat sich mit einer Potion auf \(hero.mp) MP geheilt")
        case 13: hero.mp += 100
            if hero.mp > hero.fullHp { hero.mp = hero.fullMp }
            print("\(hero.name) hat sich mit einer Potion auf \(hero.mp) MP geheilt")
        default:
            print()
        }
    }
}
// HP Potion Instanzen

let potionSmall = Potion(name: "Potion klein", price: 100, potionTyp: 1, amonthOfHeal: 200, description: "Heilt 200 HP")
let potionMiddle = Potion(name: "Potion mittel", price: 400, potionTyp: 1, amonthOfHeal: 500, description: "Heilt 500 HP")
let potionBig = Potion(name: "Potion groß", price: 1500, potionTyp: 1, amonthOfHeal: 1000, description: "Heilt 1000 HP")
let holyPotion = Potion(name: "Heilige Potion", price: 3500, potionTyp: 1, amonthOfHeal: 999999, description: "Heilt vollständig")

// MP Potion Instanzen

let atherSmall = Potion(name: "Ather klein", price: 200, potionTyp: 2, amonthOfHeal: 20, description: "Regeneriert 20 MP")
let atherMiddle = Potion(name: "Ather mittel", price: 600, potionTyp: 2, amonthOfHeal: 50, description: "Regeneriert 50 MP")
let atherBig = Potion(name: "Ather groß", price: 2000, potionTyp: 2, amonthOfHeal: 100, description: "Regeneriert 100 MP")
let holyAther = Potion(name: "Heiliger Ather", price: 5500, potionTyp: 2, amonthOfHeal: 999999, description: "Regeneriert vollständig MP")


