//
//  UtilKBundle.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/9/15.
//


import Foundation

public extension Bundle {
    var iconFileName: String? {
        guard let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
              let iconFileName = iconFiles.last else {
            return nil
        }
        return iconFileName
    }
}

public final class UtilKBundle {
    public static func appIcon(bundle: Bundle = .main) -> String {
        guard let icons = bundle.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
              let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
              let iconFileName = iconFiles.last
        else {
            return "app"
        }
        return iconFileName
    }
}
