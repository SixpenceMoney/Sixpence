import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result
import Money
import Foundation


class MoneyField: UITextField, UITextFieldDelegate {

    // TODO: Use the VM instead
    @available(*, deprecated)
    let money: Property<Money>

    private let textInputVM = TextInputViewModel.shared
    
    // MARK: - Initializers
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }

    init(_ coder: NSCoder? = nil) {
        self.money = Property(capturing: textInputVM.moneyToShow)

        if let coder = coder {
            super.init(coder: coder)!
        } else {
            super.init(frame: CGRect.zero)
        }

        self.delegate = self
        self.keyboardType = .numberPad
    }
    
    // MARK: - Actions
    
    func setMoney(_ money: Money) {
        textInputVM.setKeys(fromMoney: money)
    }
    
    // MARK: - Key Press Handling
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if string == "" {  // is a backspace
            deleteBackward()
        } else {
            textInputVM.addKey(key: string)
        }
        
        return false
    }
    
    override func deleteBackward() {
        textInputVM.deleteLastKey()
    }

    
    // Hides the cursor
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
}