import Quick
import Nimble

@testable import Sixpence

final class MoneyFieldSpec: QuickSpec {
    override func spec() {
        
        var subject: MoneyField!
        
        beforeEach {
            subject = MoneyField()
        }
        
        context("entering money") {
            it("shows an amount based on what I entered") {
                // TODO: Add `testable` extension for UIView testing
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "5")
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "0")
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "0")
                
                expect(subject.money.value) == 5

                subject.deleteBackward()

                expect(subject.money.value) == 0.50

                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "")

                expect(subject.money.value) == 0.05

                subject.deleteBackward()

                expect(subject.money.value) == 0.00

                subject.deleteBackward()

                expect(subject.money.value) == 0.00
            }
            
            it("does nothing when I enter zeros in the beginning") {
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "0")
                _ = subject.textField(subject, shouldChangeCharactersIn: NSRange(), replacementString: "0")
                // ...and so on...
                
                expect(subject.money.value) == 0
            }
        }

        describe("setMoney(_:)") { 
            it("sets the amount") {
                subject.setMoney(111.22)
                
                expect(subject.money.value) == 111.22
            }
            
            it("sets the amount to zero") {
                subject.setMoney(0)
                
                expect(subject.money.value) == 0
            }
        }
    }
}
