import UIKit

class Spend$ViewController: UIViewController {

    @IBAction func userDidTapSpend$Button() {
        (self.navigationController as! KeyboardController).keyboardDelegate!.userTapConfirmSpend$Button()
    }
    
}
