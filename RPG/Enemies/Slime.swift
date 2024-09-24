class Slime: Enemy {
    
    override init(name: String, rare: Int, monsterIndex: Double) {
        super.init(name: name, rare: rare, monsterIndex: monsterIndex)
    }
}


let waterSlime: Slime = Slime(name: "Wasserschleim", rare: 1, monsterIndex: 1.0)
let iceSlime: Slime = Slime(name: "Eisschleim", rare: 1, monsterIndex: 1.0)
let earthSlime: Slime = Slime(name: "Erdschleim", rare: 1, monsterIndex: 1.0)
let fireSlime: Slime = Slime(name: "Feuerschleim", rare: 1, monsterIndex: 1.0)
let windSlime: Slime = Slime(name: "Windschleim", rare: 1, monsterIndex: 1.0)
let darkSlime: Slime = Slime(name: "Dunkelschleim", rare: 1, monsterIndex: 1.0)
let lightSlime: Slime = Slime(name: "Lichtschleim", rare: 1, monsterIndex: 1.0)
let legandarySlime: Slime = Slime(name: "Legendärerschleim", rare: 2, monsterIndex: 1.5)
