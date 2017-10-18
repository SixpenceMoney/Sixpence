import UIKit
import ReactiveSwift
import ReactiveCocoa

class Add$OrSpend$ViewController: UIViewController {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftButton.addTarget(self, action: #selector(leftButtonCall), for: .primaryActionTriggered)
        rightButton.addTarget(self, action: #selector(rightButtonCall), for: .primaryActionTriggered)
    }
    
    func leftButtonCall() {
        (self.navigationController as! KeyboardController).keyboardDelegate!
            .userTapAdd$Button()
    }
    
    func rightButtonCall() {
        (self.navigationController as! KeyboardController).keyboardDelegate!
            .userTapSpend$Button()
    }
}
