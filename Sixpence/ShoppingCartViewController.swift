import UIKit
import ReactiveSwift

final class ShoppingCartViewController: UIViewController {
    
    @IBOutlet weak var itemLabel: UILabel!

    var textInputVM = TextInputViewModel.shared
    var shoppingCart = ShoppingCart.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        shoppingCart.removeAllItems()

        itemLabel.reactive.text <~ textInputVM.moneyToShow.mapText(withFormat: .currency)
    }

    // MARK: - Actions

    @IBAction func userDidTapShoppingCartIcon() {
        let item = Item(amount:  textInputVM.moneyToShow.value)

        shoppingCart.add(item)

        textInputVM.setKeys(fromMoney: 0)
    }
    
    @IBAction func userDidTapShoppingCartArrowIcon() {
        (self.navigationController as! KeyboardController).keyboardDelegate?.userTapConfirmSpend$Button()
    }
    
}
