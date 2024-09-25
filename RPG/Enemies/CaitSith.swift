class CaitSith: Enemy {
    
    override init(name: String, rare: Int, monsterIndex: Double) {
        super.init(name: name, rare: rare, monsterIndex: monsterIndex)
    }
}

let caitSith: CaitSith = CaitSith(name: "Cait Sith", rare: 10, monsterIndex: 1)
