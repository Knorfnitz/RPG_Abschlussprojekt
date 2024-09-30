protocol CanUseSpecialAttack {
    
func useSpecialAttack(enemy: Enemy, critRate: Double) -> Bool
        


    func useSpecialAttackForTerminal(enemy: Enemy, critRate: Double, target: Int) -> Bool
    
}


protocol CanHaveCritDamage {
    
    func calculateCritDamage() -> Double
    
}
