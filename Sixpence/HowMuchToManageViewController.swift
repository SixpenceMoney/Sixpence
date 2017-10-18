import UIKit
import Money
import ReactiveSwift

class HowMuchToManageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountField: MoneyField!

    private let account = Account.shared
    private let keyboardInput = KeyboardInputViewModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        amountField.text = account.balance.mapText(withFormat: .currency).value

        amountField.textColor = .moneyGreen
        amountField.inputAccessoryView = {
            let btn = FinishButton()
            btn.addTarget(self, action: #selector(userTapFinishButton), for: .primaryActionTriggered)
            return btn
        }()

        amountField.reactive.text <~ keyboardInput.asMoney.mapText(withFormat: .currency)

        amountField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        keyboardInput.setKeyInput(fromMoney: 0)
    }

    // MARK: - Actions
    
    func userTapFinishButton() {
        Account.shared.debit(keyboardInput.asMoney.value)
        
        let destination = UIStoryboard(name: "DecisionScreen", bundle: nil).instantiateInitialViewController()!

        self.navigationController!.pushViewController(destination, animated: true)
    }

}
