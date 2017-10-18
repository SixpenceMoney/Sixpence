import Quick
import Nimble

@testable import Sixpence

final class MoneyFieldSpec: QuickSpec {
    override func spec() {
        
        var subject: MoneyField!

        var keyboardInput: KeyboardInputViewModel!
        
        beforeEach {
            keyboardInput = KeyboardInputViewModel()
            subject = MoneyField(keyboardInput: keyboardInput)
        }
        
        context("entering money") {
            it("shows an amount based on what I entered") {
                // TODO: Add `testable` extension for UIView testing
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "5")
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "0")
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "0")
                
                expect(keyboardInput.asMoney.value) == 5

                subject.deleteBackward()

                expect(keyboardInput.asMoney.value) == 0.50

                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "")

                expect(keyboardInput.asMoney.value) == 0.05

                subject.deleteBackward()

                expect(keyboardInput.asMoney.value) == 0.00

                subject.deleteBackward()

                expect(keyboardInput.asMoney.value) == 0.00
            }
            
            it("does nothing when I enter zeros in the beginning") {
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "0")
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "0")
                // ...and so on...
                
                expect(keyboardInput.asMoney.value) == 0
            }
        }
    }
}
