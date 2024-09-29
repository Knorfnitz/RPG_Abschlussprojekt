protocol CanUseSpecialAttack {
    
func useSpecialAttack(enemy: Enemy, critRate: Double) -> Bool
        


func useSpecialAttackForTerminal(enemy: Enemy, critRate: Double) -> Bool
    
}


protocol CanHaveCritDamage {
    
    func calculateCritDamage() -> Double
    
}
