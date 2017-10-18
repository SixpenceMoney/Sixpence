import UIKit

class TopDecisionViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        let carouselController = (childViewControllers.first! as! CarouselController)

        // Reset the views to the beginning
        carouselController.popToRootViewController(animated: true)

        // ...and the keyboard
        (carouselController.viewControllers.first! as! DecisionViewController).keyboardController!.popToRootViewController(animated: true)

        // ...and sets the entering amount to zero
        TextInputViewModel.shared.setKeys(fromMoney: 0)

        self.view.endEditing(true)
    }

}
