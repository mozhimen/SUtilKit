//
//  UtilKTask.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/9/16.
//
import Foundation

public final class UtilKTask{
    // 最接近 Kotlin delay() 的现代 Swift 方式
    public static func delay(_ milliseconds: Int) async {
        let nanoseconds = UInt64(milliseconds) * 1_000_000
        try? await Task.sleep(nanoseconds: nanoseconds)
    }
}
