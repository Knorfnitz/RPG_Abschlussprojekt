class EnemyMage: Enemy {
    
    override init(name: String, rare: Int, monsterIndex: Double) {
        super.init(name: name, rare: rare, monsterIndex: monsterIndex)
    }
}

let firemage: EnemyMage = EnemyMage(name: "Feuer Magier", rare: 1, monsterIndex: 1.5)
let watermage: EnemyMage = EnemyMage(name: "Wasser Magier", rare: 1, monsterIndex: 1.5)
let windmage: EnemyMage = EnemyMage(name: "Wind Magier", rare: 1, monsterIndex: 1.5)
let icemage: EnemyMage = EnemyMage(name: "Eis Magier", rare: 1, monsterIndex: 1.5)
let earthmage: EnemyMage = EnemyMage(name: "Earth Magier", rare: 1, monsterIndex: 1.5)
let darkmage: EnemyMage = EnemyMage(name: "Dunkel Magier", rare: 1, monsterIndex: 1.5)
let lightmage: EnemyMage = EnemyMage(name: "Licht Magier", rare: 1, monsterIndex: 1.5)
let highmage: EnemyMage = EnemyMage(name: "Hoch Magier", rare: 4, monsterIndex: 4)
