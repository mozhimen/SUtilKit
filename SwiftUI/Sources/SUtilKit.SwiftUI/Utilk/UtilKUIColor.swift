//
//  UtilKUIColor.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/8.
//
#if canImport(UIKit)
import UIKit
public extension UIColor {
    func uIColor2strHex()->String?{
        return UtilKUIColor.uIColor2strHex(self)
    }
}

public final class UtilKUIColor{
    public static func uIColor2strHex(_ uIColor:UIColor)->String?{
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let multiplier = CGFloat(255.999999)

        guard uIColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }

        if alpha == 1.0 {
            return String(
                format: "%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        } else {
            return String(
                format: "%02lX%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier),
                Int(alpha * multiplier)
            )
        }
    }
}
#endif
