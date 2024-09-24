class Goblin: Enemy {
    
    override init(name: String, rare: Int, monsterIndex: Double) {
        super.init(name: name, rare: rare, monsterIndex: monsterIndex)
    }
}
let goblinwarrior: Goblin = Goblin(name: "Goblin-Kämpfer", rare: 1, monsterIndex: 1)
let hobgoblin: Goblin = Goblin(name: "Hobgoblin", rare: 2, monsterIndex: 1.5)
let goblinShaman: Goblin = Goblin(name: "Goblin-Schamane", rare: 2, monsterIndex: 1.6)
let goblinCavalier: Goblin = Goblin(name: "Goblin-Reiter", rare: 2, monsterIndex: 1.7)
let goblinChampion: Goblin = Goblin(name: "Goblin-Champion", rare: 2, monsterIndex: 2)
let goblinLord: Goblin = Goblin(name: "Goblin-Lord", rare: 3, monsterIndex: 3)
let goblinKing: Goblin = Goblin(name: "Goblin-König", rare: 4, monsterIndex: 4)
