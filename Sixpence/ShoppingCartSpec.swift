import Quick
import Nimble

@testable import Sixpence

final class ShoppingCartSpec: QuickSpec {
    override func spec() {

        describe("ShoppingCart") {

            describe("removeAllItems()") {
                it("returns a size of 0") {
                    let subject = ShoppingCart()

                    subject.removeAllItems()

                    expect(subject.size.value) == 0
                }
            }

            describe("size") {
                it("increases when an Item is added") {
                    let subject = ShoppingCart()

                    expect(subject.size.value) == 0

                    subject.add(Item(amount: 10))

                    expect(subject.size.value) == 1
                }
            }

            describe("total") {
                it("returns the total costs and tax") {
                    let subject = ShoppingCart()

                    subject.add(Item(amount: 10))
                    subject.add(Item(amount: 10))
                    subject.add(Item(amount: 10))

                    expect(subject.total.value) == 30 + 11.25%
                }
            }

        }

    }
}
