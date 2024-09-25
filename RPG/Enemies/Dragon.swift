class Dragon: Enemy {
    
    override init(name: String, rare: Int, monsterIndex: Double) {
        super.init(name: name, rare: rare, monsterIndex: monsterIndex)
    }
}
let wyvern: Dragon = Dragon(name: "Wyvern", rare: 1, monsterIndex: 1.5)
let earthdragon: Dragon = Dragon(name: "Erddrache", rare: 2, monsterIndex: 2.5)
let firedragon: Dragon = Dragon(name: "Feuerdrache", rare: 2, monsterIndex: 2.5)
let winddragon: Dragon = Dragon(name: "Winddrache", rare: 2, monsterIndex: 1)
let waterdragon: Dragon = Dragon(name: "Wasserdrache", rare: 2, monsterIndex: 1)
let icedragon: Dragon = Dragon(name: "Eisdrache", rare: 2, monsterIndex: 1)
let darkdragon: Dragon = Dragon(name: "Dunkeldrache", rare: 2, monsterIndex: 1)
let lightdragon: Dragon = Dragon(name: "Lichtdrache", rare: 2, monsterIndex: 1)
let elderdragon: Dragon = Dragon(name: "Urdrache", rare: 4, monsterIndex: 1)
