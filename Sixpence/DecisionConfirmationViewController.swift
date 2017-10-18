import UIKit
import ReactiveSwift
import Result

final class DecisionConfirmationViewController: UIViewController {
    
    class ViewModel {
        let balance: SignalProducer<String, NoError>

        init() {
            self.balance = (Account.shared.balance)
                // Hides the currency symbol (e.g. $)
                .mapText(withFormat: .decimal)
                .producer
        }
    }

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var oldBalanceLabel: MoneyLabel!
    @IBOutlet weak var changeBalanceLabel: MoneyLabel!
    @IBOutlet weak var newBalanceLabel: MoneyField!
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        oldBalanceLabel.reactive.text <~ viewModel.balance

        numberLabel.reactive.text <~ ShoppingCart.shared.size.map { "\($0)" }

        changeBalanceLabel.reactive.text <~ ShoppingCart.shared.total.mapText(withFormat: .decimal)
        
        newBalanceLabel.reactive.text <~ Account.shared.balance
            .combineLatest(with: ShoppingCart.shared.total).producer
            .map(-)
            .mapText(withFormat: .currency)
    }

}
