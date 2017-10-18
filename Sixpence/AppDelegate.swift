import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let initialVC = UIStoryboard(name: "HowMuchToManageScreen", bundle: nil)
            .instantiateInitialViewController()!

        self.window!.rootViewController = {
            let controller = UINavigationController(rootViewController: initialVC)
            controller.setNavigationBarHidden(true, animated: false)
            return controller
        }()

        self.window?.makeKeyAndVisible()
        
        return true
    }

}

