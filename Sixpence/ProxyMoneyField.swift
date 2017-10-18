import UIKit

final class ProxyMoneyField: MoneyField {

    weak var remote: MoneyField?

    required init?(coder aDecoder: NSCoder) {
        super.init(aDecoder)
    }

    // Prevents directly manipulating this object, but the remote instead
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        remote?.becomeFirstResponder()
        return false
    }

}
