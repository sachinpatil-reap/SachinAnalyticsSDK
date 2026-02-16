import UIKit
import ObjectiveC

extension UIControl {

    static func swizzleSendAction() {

        let original = class_getInstanceMethod(
            UIControl.self,
            #selector(sendAction(_:to:for:))
        )

        let swizzled = class_getInstanceMethod(
            UIControl.self,
            #selector(swizzled_sendAction(_:to:for:))
        )

        method_exchangeImplementations(original!, swizzled!)
    }

    @objc func swizzled_sendAction(
        _ action: Selector,
        to target: Any?,
        for event: UIEvent?
    ) {

        let controlName = String(describing: type(of: self))

        FirebaseManager.logEvent(
            name: "button_click",
            params: ["control_name": controlName]
        )

        swizzled_sendAction(action, to: target, for: event)
    }
}
