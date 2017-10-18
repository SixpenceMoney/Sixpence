import XCTest
import Nimble

extension NewUser where Screen == HowMuchToManageScreen {

    func opensApp(file: FileString = #file, line: UInt = #line,
                  _ closure: ((HowMuchToManageScreen)->())? = nil)
    {
        
        XCUIApplication().launch()
        
        guard let initialScreen = HowMuchToManageScreen.init() else {
            fail("expected <\(HowMuchToManageScreen.self)> to be the first screen", file: file, line: line)
            return
        }

        closure?(initialScreen)
    }
    
    func enterBalance(file: String = #file, line: UInt = #line,
                      typing keysTyped: String,
                      _ closure: ((DecisionScreen)->())? = nil) -> NewUser<DecisionScreen>?
    {
        
        guard let currentScreen = HowMuchToManageScreen.init() else {
            fail("Couldn't enter an amount. Wrong screen.", file: file, line: line)
            return nil
        }

        currentScreen.amountField.typeText(keysTyped)
        currentScreen.keyboardButton!.tap()

        guard let nextScreen = DecisionScreen.init() else {
            fail("Didn't get to the \(DecisionScreen.self).", file: file, line: line)
            return nil
        }

        closure?(nextScreen)
        
        return NewUser<DecisionScreen>()
    }
    
}
