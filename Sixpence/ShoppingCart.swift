import Money
import ReactiveSwift

final class ShoppingCart {

    static let shared = ShoppingCart()

    // The size of the shopping cart
    let size: Property<Int>

    // The subtotal and the sales tax
    let total: Property<Money>

    private let items = MutableProperty<[Item]>([])

    // MARK: - Initializers

    init() {
        self.size = Property(capturing: items.map { $0.count} )
        self.total = Property(capturing: items
            // Gets the subtotal
            .map { xs  in
                let subtotal = xs.reduce(0, { memo, item in
                    memo + item.amount
                })

                return subtotal
            }
            // Adds the sales tax
            .map { subtotal in
                subtotal + 11.25%
            }
        )
    }

    // MARK: - Actions

    func add(_ item: Item) {
        self.items.value = items.value + [item]
    }

    func removeAllItems() {
        self.items.value = []
    }
}
