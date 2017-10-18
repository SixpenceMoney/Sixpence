import UIKit
import Money
import ReactiveSwift
import Result

final class AnimatedMoneyLabel: MoneyLabel {

    // The number of seconds animating
    @IBInspectable var duration: Double = 1.7

    private var moneyToText: Disposable!
    private var myTimer: Disposable?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        moneyToText = money.producer
            .combinePrevious(self.money.value)
            .startWithValues { prev, curr in
                self.setText(fromValue: prev, to: curr)
            }
    }
    
    // Repeatedly sets the text <$0.00, $1.00, $2.00, ...> until it reaches the end
    private func setText(fromValue start: Money, to end: Money) {
        myTimer?.dispose()
        
        self.myTimer = SignalProducer<Date, NoError>
            .timer(interval: .milliseconds(1), on: QueueScheduler.main)
            .combinePrevious(Date())
            .map { prev, curr in
                return curr.timeIntervalSince(prev)
            }
            .scan(0.0, +)
            .map { progress -> Money in
                guard (progress < self.duration) else {
                    return end
                }

                let percent = Float(progress / self.duration)
                let easingFactor = 1.0 - powf((1.0 - percent), 3.0)
                let result = Float(start.floatValue) + (easingFactor * (Float(end.floatValue) - Float(start.floatValue)))
                
                return Money(result)
            }
            .mapText(withFormat: .currency)
            .startWithValues { moneyText in
                self.text = moneyText
            }
    }
    
}
