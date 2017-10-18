import Quick
import Nimble
import Money

@testable import Sixpence

class MoneyStrideableTest: QuickSpec {
    override func spec() {
        describe("stride(to:from:by:)") {
            it("does the same thing") {
                expect(Array(stride(from: 1, through: 3, by: 1))) == [1, 2, 3]
                expect(Array(stride(from: 3, through: 1, by: -1))) == [3, 2, 1]
                
                expect(Array(stride(from: Money(1), through: Money(3), by: 1))) == [Money(1), Money(2), Money(3)]
                expect(Array(stride(from: Money(3), through: Money(1), by: -1))) == [Money(3), Money(2), Money(1)]
                expect(Array(stride(from: Money(floatLiteral: 0.01), through: Money(0.03), by: 0.01))) == [Money(0.01), Money(0.02), Money(0.03)]
            }
        }
        
        describe("distance(to:)") {
            it("behaves the same as integers") {
                // where a < b
                expect(
                    Money(0).distance(to: Money(10))
                    ) == Money(0.distance(to: 10))
                
                // where a > b
                expect(
                    Money(10).distance(to: Money(0))
                    ) == Money(10.distance(to: 0))
                
                // where a = b
                expect(
                    Money(5).distance(to: Money(5))
                    ) == Money(5.distance(to: 5))
                
                // where a and b are negative
                expect(
                    Money(-5).distance(to: Money(-10))
                    ) == Money((-5).distance(to: -10))
            }
        }
        
        describe("advanced(by:)") {
            it("behaves the same as integers") {
                // where a < b
                expect(
                    Money(0).advanced(by: Money(10))
                    ) == Money(0.advanced(by: 10))
                
                // where a > b
                expect(
                    Money(10).advanced(by: Money(0))
                    ) == Money(10.advanced(by: 0))
                
                // where a = b
                expect(
                    Money(5).advanced(by: Money(5))
                    ) == Money(5.advanced(by: 5))
                
                // where a and b are negative
                expect(
                    Money(-5).advanced(by: Money(-10))
                    ) == Money((-5).advanced(by: -10))
            }
        }
    }
}
