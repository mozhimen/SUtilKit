//
//  UtilKNSColor.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/8.
//
#if canImport(AppKit)
import AppKit

public extension NSColor {
    func nSColor2strHex()->String{
        return UtilKNSColor.nSColor2strHex(self)
    }
}

public final class UtilKNSColor{
    public static func nSColor2strHex(_ nSColor:NSColor)->String{
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])

        return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
}
#endif
