//
//  GlobalAnalytics.swift
//  GlobalAnalytics
//
//  Created by Vinayak Asabe on 16/02/26.

import Foundation
import FirebaseCore

public final class GlobalAnalytics {

    private static var isInitialized = false

    public static func initialize() {
        guard !isInitialized else { return }
        isInitialized = true

        FirebaseApp.configure()
        AutoTrackingEngine.start()
    }

    public static func setUser(
        userId: String?,
        email: String?,
        phone: String?,
        shaKey: String?
    ) {
        ConfigManager.shared.setUser(
            userId: userId,
            email: email,
            phone: phone,
            shaKey: shaKey
        )
    }
}
