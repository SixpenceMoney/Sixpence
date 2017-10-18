import ReactiveSwift
import Money

enum CurrencyFormat {
    case currency  // e.g. $5.00, $9,999.00
    case decimal   // e.g. 8.88
}

extension SignalProducer where Value == Money {
    // Returns a string of Money
    func mapText(withFormat format: CurrencyFormat) -> SignalProducer<String, Error> {
        return self.map { (money) -> String in
            switch format {
            case .currency:
                return money.formatted(withStyle: NumberFormatter.Style.currency)
            case .decimal:
                return "\(NSString(format: "%.2f", money.floatValue))"
            }
        }
    }

}

extension PropertyProtocol where Value == Money {
    func mapText(withFormat format: CurrencyFormat) -> Property<String> {
        return Property<String>(
            initial: Money(0).formatted(withStyle: .currency),
            then: self.producer.mapText(withFormat: format)
        )
    }
}
