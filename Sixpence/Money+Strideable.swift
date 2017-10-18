import Money

extension _Money: Strideable {
    public typealias Stride = _Money
    
    public func distance(to other: _Money<C>) -> _Money<C> {
        return _Money<C>(floatLiteral: self.floatValue.distance(to: other.floatValue))
    }
    
    public func advanced(by n: _Money<C>) -> _Money<C> {
        return _Money<C>(floatLiteral: self.floatValue.advanced(by: n.floatValue))
    }
}
