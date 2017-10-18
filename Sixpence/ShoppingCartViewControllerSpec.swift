import Quick
import Nimble

@testable import Sixpence

final class ShoppingCartViewControllerSpec: QuickSpec {
    override func spec() {

        var subject: ShoppingCartViewController!

        var textInput: TextInputViewModel!
        var shoppingCart: ShoppingCart!

        beforeEach {
            subject = UIStoryboard(name: "DecisionScreen", bundle: nil)
                .instantiateViewController(withIdentifier: "ShoppingCartViewController")
                as! ShoppingCartViewController

            textInput = TextInputViewModel()
            shoppingCart = ShoppingCart()
            subject.textInputVM = textInput
            subject.shoppingCart = shoppingCart

            // TODO: Create a test factory method
            // This must be called last
            _ = subject.view
        }

        it("shows 0 at first") {
            expect(subject.itemLabel.text) == "-$0.00"
        }

        context("when user has entered an amount") {

            beforeEach {
                textInput.setKeys(fromMoney: 99.99)
            }

            it("shows the amount on the label") {
                expect(subject.itemLabel.text) == "-$99.99"
            }

            it("clears the amount when tapped") {
                subject.userDidTapShoppingCartIcon()

                expect(subject.itemLabel.text) == "-$0.00"
            }

            it("adds an Item to the Shopping Cart") {
                subject.userDidTapShoppingCartIcon()

                expect(shoppingCart.size.value) == 1
            }
        }
    }

}
