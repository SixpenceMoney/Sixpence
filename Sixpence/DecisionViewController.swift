import UIKit
import Money
import ReactiveSwift


class DecisionViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var balanceLabel: AnimatedMoneyLabel!
    @IBOutlet weak var changeBalanceLabel: ProxyMoneyField!
    
    var keyboardController: KeyboardController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.keyboardController = UIStoryboard(name: "DecisionScreen", bundle: nil).instantiateViewController(withIdentifier: "KeyboardController") as! KeyboardController

        balanceLabel.money <~ Account.shared.balance

        keyboardController.keyboardDelegate = self
        
        changeBalanceLabel.remote = (self.navigationController as! CarouselController)
            .remoteMoneyField

        changeBalanceLabel.reactive.text <~ TextInputViewModel.shared.moneyToShow.mapText(withFormat: .decimal)

        changeBalanceLabel.remote?.inputAccessoryView = {
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 60))
            let view = keyboardController.view!
            view.translatesAutoresizingMaskIntoConstraints = false
            
            containerView.addSubview(view)
            NSLayoutConstraint.activate([
                containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            ])
            
            return containerView
        }()

    }
}

extension DecisionViewController: KeyboardDelegate {
    
    // MARK: - Actions
    
    func userTapAdd$Button() {
        let amountToAdd = changeBalanceLabel.remote!.money.value
        
        Account.shared.debit(amountToAdd)
        
        changeBalanceLabel.remote?.setMoney(0)
        changeBalanceLabel.remote?.endEditing(true)
        navigationController?.popToRootViewController(animated: true)
        keyboardController.popToRootViewController(animated: false)
    }
    
    func userTapSpend$Button() {
        performSegue(withIdentifier: "PreviewBalance", sender: self)
    }

    func userTapConfirmAdd$Button() {
        return
    }

    func userTapConfirmSpend$Button() {
        let amountToSubtract = ShoppingCart.shared.total.value

        Account.shared.credit(amountToSubtract)
        
        changeBalanceLabel.remote?.setMoney(0)
        changeBalanceLabel.remote?.endEditing(true)
        navigationController?.popToRootViewController(animated: true)
        keyboardController.popToRootViewController(animated: false)
    }
    
}

