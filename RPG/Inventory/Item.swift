class Item{
    let name: String
    let price: Int
    let sellPrice: Int
    var amount: Int = 0
    let description: String
    
    init(name: String, price: Int, description: String){
        self.name = name
        self.price = price
        self.sellPrice = price/2
        self.description = description
    }
}
