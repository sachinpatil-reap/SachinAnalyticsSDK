import Foundation

struct EventBuilder {

    static func build(
        name: String,
        params: [String: Any] = [:]
    ) -> (String, [String: Any]) {

        var finalParams = ConfigManager.shared.globalParams

        finalParams["platform"] = "ios"
        finalParams["app_version"] =
            Bundle.main.infoDictionary?["CFBundleShortVersionString"]

        params.forEach { finalParams[$0.key] = $0.value }

        return (name, finalParams)
    }
}
