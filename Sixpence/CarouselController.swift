import UIKit

final class CarouselController: UINavigationController {
    
    let remoteMoneyField: MoneyField
    
    required init?(coder aDecoder: NSCoder) {
        remoteMoneyField = MoneyField(coder: aDecoder)!

        super.init(coder: aDecoder)

        view.addSubview(remoteMoneyField)
    }
    
}
