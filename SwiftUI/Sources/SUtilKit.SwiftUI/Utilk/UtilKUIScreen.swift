//
//  UtilKScreen.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/19.
//
import SwiftUI
public final class UtilKUIScreen{
    @MainActor
    public static func getSize()->CGSize{
        return UIScreen.main.bounds.size
    }
    
    @MainActor
    public static func getWidth()->Double{
        return getSize().width
    }
    
    @MainActor
    public static func getHeight()->Double{
        return getSize().height
    }
    
    @MainActor
    public static func getRelativeWidth()->Double{
        return min(getWidth(), getHeight())
    }
}
