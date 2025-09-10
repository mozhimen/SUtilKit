//
//  CNSRegularExpression.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/9/10.
//
import Foundation

public final class CNSRegularExpression{
    // 邮箱正则表达式，类似于 Android 的 Patterns.EMAIL_ADDRESS
     static let EMAIL_ADDRESS: NSRegularExpression = {
         let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         return try! NSRegularExpression(pattern: pattern)
     }()
}
