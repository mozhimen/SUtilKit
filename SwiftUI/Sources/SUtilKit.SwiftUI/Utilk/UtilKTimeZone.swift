//
//  UtilKTimeZone.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/31.
//
import Foundation
public final class UtilKTimeZone{
    public static func get(secondsFromGMT:Int)->TimeZone?{
        return TimeZone.init(secondsFromGMT: 0)
    }
}
