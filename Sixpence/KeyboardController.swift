import UIKit

protocol KeyboardDelegate {
    func userTapAdd$Button()
    func userTapConfirmAdd$Button()

    func userTapSpend$Button()
    func userTapConfirmSpend$Button()
}

class KeyboardController: UINavigationController {

    var keyboardDelegate: KeyboardDelegate?

}
