import XCTest
import Nimble

final class HowMuchToManageScreen {
    
    private let app = XCUIApplication()
    
    // MARK: - Properties
    
    var titleLabel: XCUIElement {
        return app.staticTexts["HowMuchToManageScreen.title"]
    }
    
    var amountField: XCUIElement {
        return app.textFields["HowMuchToManageScreen.amount"]
    }
    
    var keyboard: XCUIElement? {
        return app.keyboards.allElementsBoundByIndex.first
    }
    
    var keyboardButton: XCUIElement? {
        return app.buttons["HowMuchToManageScreen.button"]
    }
    
    // MARK: - Initializer
    
    init?(file: String = #file, line: UInt = #line) {
        let expectations = gatherExpectations {
            expect(self.titleLabel.exists).toEventually(beTrue())
            expect(self.amountField.exists).toEventually(beTrue())
            expect(self.keyboard?.exists).toEventually(beTrue())
            expect(self.keyboardButton?.exists).toEventually(beTrue())
        }

        let allPassed = expectations
            .map{ $0.success }
            .reduce(true, { $0 && $1 })
        
        guard allPassed else {
            fail("Missing elements in <\(HowMuchToManageScreen.self)>", file: file, line: line)
            return nil
        }
    }
}
