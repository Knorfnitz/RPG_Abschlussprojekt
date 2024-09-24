class Slime: Enemie {
    
    override init(name: String, rare: Int, monsterIndex: Double) {
        super.init(name: name, rare: rare, monsterIndex: monsterIndex)
    }
}


let waterSlime: Slime = Slime(name: "Wasserschleim", rare: 1, monsterIndex: 1.0)
