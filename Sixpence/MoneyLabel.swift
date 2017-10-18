import UIKit
import Money
import ReactiveSwift

class MoneyLabel: UILabel {
    
    let money: MutableProperty<Money>
    
    required init?(coder aDecoder: NSCoder) {
        self.money = MutableProperty(Money(0))

        super.init(coder: aDecoder)
    }
    
}
