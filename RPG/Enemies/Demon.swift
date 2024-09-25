class Demon: Enemy {
    
    override init(name: String, rare: Int, monsterIndex: Double) {
        super.init(name: name, rare: rare, monsterIndex: monsterIndex)
    }
}

let lowdemon: Demon = Demon(name: "Niederer Dämon", rare: 1, monsterIndex: 1.2)
let middemon: Demon = Demon(name: "Mittlerer Dämon", rare: 2, monsterIndex: 2.2)
let highdemon: Demon = Demon(name: "Hochdämon", rare: 3, monsterIndex: 3.2)
let demonlord: Demon = Demon(name: "Dämonenlord", rare: 4, monsterIndex: 4.0)
let succubus: Demon = Demon(name: "Sukkubus", rare: 3, monsterIndex: 3.0)
let demonking: Demon = Demon(name: "Dämonenkönig", rare: 5, monsterIndex: 5.0)
let demonmage: Demon = Demon(name: "Dämonen Magier", rare: 3, monsterIndex: 3.0)
let devil: Demon = Demon(name: "Teufel", rare: 2, monsterIndex: 2.0)
