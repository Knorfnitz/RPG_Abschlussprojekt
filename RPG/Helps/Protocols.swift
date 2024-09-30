protocol CanUseSpecialAttack {
    
func useSpecialAttack(enemy: Enemy, critRate: Double) -> Bool
        


    func useSpecialAttackForTerminal(enemy: Enemy, critRate: Double, target: Int) -> (Bool, Bool) // zweiter Bool für nicht genug Mana
    
}


protocol CanHaveCritDamage {
    
    func calculateCritDamage() -> Double
    
}
