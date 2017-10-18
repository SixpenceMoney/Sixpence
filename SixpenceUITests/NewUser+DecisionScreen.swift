import XCTest
import Nimble

extension NewUser where Screen == DecisionScreen {
    func spendAmount(file: FileString = #file,
                     line: UInt = #line,
                     typing keysTyped: String,
                     _ closure: ((DecisionScreen)->())?)
    {
        guard let screen = DecisionScreen() else {
            fail("Didn't get to the \(DecisionScreen.self).", file: file, line: line)
            return
        }
        
        screen.changeBalanceField.tap()
        screen.changeBalanceField.typeText(keysTyped)
        screen.spend$Button.tap()
        
        closure?(screen)
    }
    
    func confirmSpending(file: FileString = #file,
                         line: UInt = #line,
                         _ closure: ((DecisionScreen)->())?)
    {
        guard let screen = DecisionScreen() else {
            fail("Didn't get to the \(DecisionScreen.self).", file: file, line: line)
            return
        }
        
//        screen.confirmSpend$Button.isHittable
        
        closure?(screen)
    }
}
