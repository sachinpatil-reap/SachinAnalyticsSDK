import Foundation

final class ConfigManager {

    static let shared = ConfigManager()

    private init() {}

    var globalParams: [String: Any] = [:]

    func setUser(
        userId: String?,
        email: String?,
        phone: String?,
        shaKey: String?
    ) {
        globalParams["user_id"] = userId
        globalParams["email"] = email
        globalParams["phone"] = phone
        globalParams["sha_key"] = shaKey
    }
}
