import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result
import Money
import Foundation


class MoneyField: UITextField, UITextFieldDelegate {

    private let keyboardInput: KeyboardInputViewModel
    
    // MARK: - Initializers
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }

    init(_ coder: NSCoder? = nil,
         keyboardInput: KeyboardInputViewModel = KeyboardInputViewModel.shared) {
        self.keyboardInput = keyboardInput

        if let coder = coder {
            super.init(coder: coder)!
        } else {
            super.init(frame: CGRect.zero)
        }

        self.delegate = self
        self.keyboardType = .numberPad
    }
    
    // MARK: - Key Press Handling
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if string == "" {  // is a backspace
            deleteBackward()
        } else {
            keyboardInput.addKeyInput(key: string)
        }
        
        return false
    }
    
    override func deleteBackward() {
        keyboardInput.deleteLastKeyInput()
    }

    
    // Hides the cursor
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
}
