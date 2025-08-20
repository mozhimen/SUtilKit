//
//  UtilKDevice.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/18.
//
import UIKit
public extension UIDevice{
    static var isPhone :Bool {
        UtilKUIDevice.isPhone()
    }
}
public final class UtilKUIDevice{
    @MainActor
    public static func getUserInterfaceIdiom()->UIUserInterfaceIdiom{
        return UIDevice.current.userInterfaceIdiom
    }
    
    @MainActor
    public static func isPhone()->Bool{
        return getUserInterfaceIdiom() == .phone
    }
}
