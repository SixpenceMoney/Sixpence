import Quick
import Nimble
import Money
import ReactiveSwift

@testable import Sixpence

final class AccountTest: QuickSpec {
    
    override func spec() {
        
        var subject: Account!
        
        beforeEach {
            subject = Account()
        }
        
        it("starts off with only 0") {
            expect(subject.balance.value) == 0
        }
        
        it("adds money to the budget") {
            subject.debit(100)
            
            expect(subject.balance.value) == 100
        }
        
        it("spends money to the budget") {
            subject.credit(100)

            expect(subject.balance.value) == -100
        }
    }
}
