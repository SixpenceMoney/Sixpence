import ReactiveSwift
import Money

// Shows money on the screen based on keyboard input
final class TextInputViewModel {

    static let shared = TextInputViewModel()

    // The money to show based on the keys entered
    let moneyToShow: Property<Money>

    // The keys entered by the user
    private var keysInputted = MutableProperty<[String]>([])

    // MARK: - Initializers

    init() {
        let _money = keysInputted.map {
            Money(minorUnits: Int($0.joined()) ?? 0)
        }
        self.moneyToShow = Property(capturing: _money)
    }

    // MARK: - Methods

    func addKey(key: String) {
        keysInputted.value.append(key)
    }

    func deleteLastKey() {
        guard keysInputted.value.isPresent else {
            return
        }

        keysInputted.value = Array(keysInputted.value[0 ..< keysInputted.value.endIndex-1])
    }

    func setKeys(fromMoney money: Money) {
        let newValue: [String] = money
            .formatted(withStyle: .decimal)
            .replacingOccurrences(of: ".", with: "")
            .characters.map{ char in
                String(char)
        }

        keysInputted.value = newValue
    }

}
