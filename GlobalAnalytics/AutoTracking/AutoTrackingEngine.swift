import UIKit

final class AutoTrackingEngine {

    static func start() {
        UIViewController.swizzleViewDidAppear()
        UIControl.swizzleSendAction()
        UIHostingControllerSwizzle.swizzle()
        observeLifecycle()
    }

    private static func observeLifecycle() {
        NotificationCenter.default.addObserver(
            forName: UIApplication.didBecomeActiveNotification,
            object: nil,
            queue: .main
        ) { _ in
            FirebaseManager.logEvent(name: "app_foreground")
        }

        NotificationCenter.default.addObserver(
            forName: UIApplication.didEnterBackgroundNotification,
            object: nil,
            queue: .main
        ) { _ in
            FirebaseManager.logEvent(name: "app_background")
        }
    }
}
