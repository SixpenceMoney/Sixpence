import UIKit

class Add$ViewController: UIViewController {
    
    @IBAction func userDidTapAdd$Button() {
        (self.navigationController as! KeyboardController).keyboardDelegate!.userTapConfirmAdd$Button()
    }
    
}
