//
//  UtilKLocale.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/8.
//
import SwiftUI
import UIKit
import Foundation

public final class UtilLocale {
    
    public static func get()->Locale{
        return get_current()
    }
    
    public static func get_current()->Locale{
        return Locale.current
    }
}
