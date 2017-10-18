import ReactiveSwift
import Money

// Transforms key input from the user to money
final class KeyboardInputViewModel {

    static let shared = KeyboardInputViewModel()

    // The money to show based on the keys entered
    let asMoney: Property<Money>

    // The keys inputted by the user
    private var keysInputted = MutableProperty<[String]>([])

    // MARK: - Initializers

    init() {
        let _money = keysInputted.map {
            Money(minorUnits: Int($0.joined()) ?? 0)
        }
        self.asMoney = Property(capturing: _money)
    }

    // MARK: - Methods

    func addKeyInput(key: String) {
        keysInputted.value.append(key)
    }

    func deleteLastKeyInput() {
        guard keysInputted.value.isPresent else {
            return
        }

        keysInputted.value = Array(keysInputted.value[0 ..< keysInputted.value.endIndex-1])
    }

    func setKeyInput(fromMoney money: Money) {
        let newValue: [String] = money
            .formatted(withStyle: .decimal)
            .replacingOccurrences(of: ".", with: "")
            .characters.map{ char in
                String(char)
        }

        keysInputted.value = newValue
    }

}
