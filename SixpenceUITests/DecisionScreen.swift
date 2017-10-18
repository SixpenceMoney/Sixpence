import XCTest
import Nimble


final class DecisionScreen {
    
    private let app = XCUIApplication()
    
    // MARK: - Properties

    var titleLabel: XCUIElement {
        return app.staticTexts["DecisionScreen.titleLabel"]
    }

    var balanceLabel: XCUIElement {
        return app.staticTexts["DecisionScreen.balanceLabel"]
    }
    
    var changeBalanceField: XCUIElement {
        return app.textFields["DecisionScreen.changeBalanceField"]
    }
    
    // MARK: - Transient Properties
    
    var spend$Button: XCUIElement {
        return app.buttons["DecisionScreen.spend$Button"]
    }
    
    var add$Button: XCUIElement {
        return app.buttons["DecisionScreen.add$Button"]
    }
    
    var confirmSpend$Button: XCUIElement {
        return app.buttons["DecisionScreen.confirmSpend$Button"]
    }

    // MARK: - Initializer
    
    init?(file: String = #file, line: UInt = #line) {
        let expectations = gatherExpectations {
            expect(self.titleLabel.exists).toEventually(beTrue())
            expect(self.balanceLabel.exists).toEventually(beTrue())
        }
        
        let allPassed = expectations
            .map{ $0.success }
            .reduce(true, { $0 && $1 })
        
        guard allPassed else {
            fail("Missing elements in <\(DecisionScreen.self)>", file: file, line: line)
            return nil
        }
    }
}
