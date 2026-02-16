import SwiftUI
import ObjectiveC

final class UIHostingControllerSwizzle {

    static func swizzle() {

        let original = class_getInstanceMethod(
            UIHostingController<AnyView>.self,
            #selector(UIViewController.viewDidAppear(_:))
        )

        let swizzled = class_getInstanceMethod(
            UIHostingController<AnyView>.self,
            #selector(swizzled_hostingViewDidAppear(_:))
        )

        method_exchangeImplementations(original!, swizzled!)
    }
}

extension UIHostingController {

    @objc func swizzled_hostingViewDidAppear(_ animated: Bool) {
        self.swizzled_hostingViewDidAppear(animated)

        let screenName = String(describing: type(of: self.rootView))
        FirebaseManager.logScreen(name: screenName)
    }
}
