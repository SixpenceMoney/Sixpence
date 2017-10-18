import Money
import ReactiveSwift

final class Account {
    
    // A shared instance
    static let shared = Account()

    // The total amount of money
    let balance: Property<Money>

    private let transactions = MutableProperty<[Transaction]>([])
    
    init() {
        self.balance = Property<Money>(
            transactions.map { xs -> Money in
                xs.reduce(0, { memo, x -> Money in
                    memo + x.amount
                })
            }
        )
    }
    
    func debit(_ amount: Money) {
        transactions.value.append(Transaction(amount: amount))
    }

    func credit(_ amount: Money) {
        transactions.value.append(Transaction(amount: -amount))
    }
}
