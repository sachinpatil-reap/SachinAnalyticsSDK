import FirebaseAnalytics

final class FirebaseManager {

    static func logEvent(
        name: String,
        params: [String: Any] = [:]
    ) {
        let (eventName, finalParams) =
            EventBuilder.build(name: name, params: params)

        Analytics.logEvent(eventName, parameters: finalParams)
    }

    static func logScreen(name: String) {
        Analytics.logEvent(
            AnalyticsEventScreenView,
            parameters: [
                AnalyticsParameterScreenName: name,
                AnalyticsParameterScreenClass: name
            ]
        )
    }
}
