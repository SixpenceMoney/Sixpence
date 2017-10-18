import Quick
import Nimble
import Money

@testable import Sixpence

final class TransactionTest: QuickSpec {
    override func spec() {

        describe("init()") {
            it("returns the payment amount") {
                let subject = Transaction(amount: 100)

                expect(subject.amount) == Money(100)
            }
            
            it("returns the current date") {
                let subject = Transaction(amount: 9999)

                expect(subject.date).to(beCloseTo(Date(), within: 0.1))
            }
        }

    }
}
