struct Armor{
    let name: String
    var extraHP: Int
    var extraDEF: Int
    var amount: Int = 0
}

let armorWood = Armor(name: "Holzrüstung", extraHP: 50, extraDEF: 10)
let armorIron = Armor(name: "Eisenrüstung", extraHP: 100, extraDEF: 20)
let armorSteel = Armor(name: "Stahlrüstung", extraHP: 200, extraDEF: 40)
let armorSilver = Armor(name: "Silberrüstung", extraHP: 500, extraDEF: 100)
let armorGold = Armor(name: "Goldrüstung", extraHP: 1000, extraDEF: 250)
let armorMythril = Armor(name: "Mythrilrüstung", extraHP: 5000, extraDEF: 500)
