import UIKit
import Money
import ReactiveSwift

class HowMuchToManageViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountField: MoneyField!

    override func viewDidLoad() {
        super.viewDidLoad()

        amountField.text = Account.shared.balance.mapText(withFormat: .currency).value

        amountField.textColor = .moneyGreen
        amountField.inputAccessoryView = {
            let btn = FinishButton()
            btn.addTarget(self, action: #selector(userTapFinishButton), for: .primaryActionTriggered)
            return btn
        }()

        amountField.reactive.text <~ amountField.money.mapText(withFormat: .currency)

        amountField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        amountField.setMoney(0)
    }

    // MARK: - Actions
    
    func userTapFinishButton() {
        Account.shared.debit(amountField.money.value)
        
        let destination = UIStoryboard(name: "DecisionScreen", bundle: nil).instantiateInitialViewController()!

        self.navigationController!.pushViewController(destination, animated: true)
    }

}
