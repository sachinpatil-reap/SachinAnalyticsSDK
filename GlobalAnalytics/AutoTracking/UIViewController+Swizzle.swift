import UIKit
import ObjectiveC

extension UIViewController {

    static func swizzleViewDidAppear() {

        let original = class_getInstanceMethod(
            UIViewController.self,
            #selector(viewDidAppear(_:))
        )

        let swizzled = class_getInstanceMethod(
            UIViewController.self,
            #selector(swizzled_viewDidAppear(_:))
        )

        method_exchangeImplementations(original!, swizzled!)
    }

    @objc func swizzled_viewDidAppear(_ animated: Bool) {
        self.swizzled_viewDidAppear(animated)

        let screenName = String(describing: type(of: self))
        FirebaseManager.logScreen(name: screenName)
    }
}
