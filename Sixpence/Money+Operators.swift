import Money

struct Percent {
    fileprivate let value: Double
    
    init(_ value: Double) {
        // value must be a decimal
        guard value >= 0 && value <= 1.0 else {
            fatalError()
        }

        self.value = value
    }
}

typealias Tax = Percent
typealias Tip = Percent

func +(a: Money, b: Money) -> Money {
    return a.adding(b)
}

func +(x: Percent, y: Percent) -> Percent {
    return Percent(x.value + y.value)
}

func +(a: Money, b: Percent) -> Money {
    let x = a.floatValue + (a.floatValue * b.value)
    
    return Money(x)
}

postfix operator %
postfix func %(x: Double) -> Percent {
    return Percent(x / 100.0)
}


