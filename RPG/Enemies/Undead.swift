class Undead: Enemy {
    
    override init(name: String, rare: Int, monsterIndex: Double) {
        super.init(name: name, rare: rare, monsterIndex: monsterIndex)
    }
}
let zombie: Undead = Undead(name: "Zombie", rare: 1, monsterIndex: 1)
let skeleton: Undead = Undead(name: "Skelett", rare: 1, monsterIndex: 1)
let ghost: Undead = Undead(name: "Poltergeist", rare: 2, monsterIndex: 1.5)
let summoner: Undead = Undead(name: "Totenbeschwörer", rare: 2, monsterIndex: 1.8)
let ghul: Undead = Undead(name: "Ghul", rare: 2, monsterIndex: 2.2)
let lich: Undead = Undead(name: "Lich", rare: 3, monsterIndex: 3)
let dullahan: Undead = Undead(name: "Dullahan", rare: 4, monsterIndex: 3.5)
