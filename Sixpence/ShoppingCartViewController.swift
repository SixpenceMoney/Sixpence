import UIKit
import ReactiveSwift

final class ShoppingCartViewController: UIViewController {
    
    @IBOutlet weak var itemLabel: UILabel!

    var keyboardInput = KeyboardInputViewModel.shared
    var shoppingCart = ShoppingCart.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        shoppingCart.removeAllItems()

        itemLabel.reactive.text <~ keyboardInput.asMoney.mapText(withFormat: .currency)
    }

    // MARK: - Actions

    @IBAction func userDidTapShoppingCartIcon() {
        let item = Item(amount:  keyboardInput.asMoney.value)

        shoppingCart.add(item)

        keyboardInput.setKeyInput(fromMoney: 0)
    }
    
    @IBAction func userDidTapShoppingCartArrowIcon() {
        (self.navigationController as! KeyboardController).keyboardDelegate?.userTapConfirmSpend$Button()
    }
    
}
