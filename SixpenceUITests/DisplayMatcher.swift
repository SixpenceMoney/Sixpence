import Quick
import Nimble

public func show(_ text: String) -> Predicate<XCUIElement> {
    return Predicate.define { actualExpression -> PredicateResult in
        let actualValue = try! actualExpression.evaluate()!

        var matches: Bool
        var msg: String
        switch actualValue.elementType {
        case .staticText:
            matches = actualValue.label == text
            msg = actualValue.label
        case .textField:
            matches = actualValue.value as! String == text
            msg = actualValue.value as! String
        default:
            return PredicateResult(status: .fail, message: .fail("Unsupported type"))
        }

        return PredicateResult(
            bool: matches,
            message: .fail("expected \(text), but got \(msg)")
        )
    }
}
