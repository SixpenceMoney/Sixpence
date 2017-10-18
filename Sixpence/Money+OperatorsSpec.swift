import Quick
import Nimble

import Money

@testable import Sixpence

final class MoneyOperatorSpec: QuickSpec {
    override func spec() {
        
        describe("Complex Expressions") {
            it("add tax") {
                expect(Money(100) + 10.00%) == 110
            }
            
            context("tips") {
                let tax: Tax = 10.00%
                let tip: Tip = 15.00%
                let price: Money = 100.00

                it("add a tip before tax") {
                    expect(price + (tax + tip)) == 125.00
                }

                it("add a tip after tax") {
                    expect((100 + 10.00%) + 15.00%) == 126.50
                }
            }
        }

        describe("Basic Expressions") {
            it("can be added") {
                let ten: Money = 10
                expect(ten + ten) == 20
            }

            // FIXME:
//            it("returns the percentage as a decimal") {
//                expect(1.0 * 11.22%).to(beCloseTo(0.1122))
//                expect(1.0 * 33.44%).to(beCloseTo(0.3344))
//            }
        }
    }
}
