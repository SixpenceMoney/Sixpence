import UIKit

extension HowMuchToManageViewController {

    class FinishButton: UIButton {
        
        convenience init() {
            self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 60))
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.backgroundColor = .moneyGreen
            self.setTitle("Finish", for: .normal)
            self.titleLabel!.font = UIFont(name: "Helvetica", size: 23)
            self.titleLabel!.textColor = .white
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

}
