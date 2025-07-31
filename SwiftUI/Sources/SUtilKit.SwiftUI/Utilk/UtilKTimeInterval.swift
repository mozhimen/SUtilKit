//
//  UtilKTimeInterval.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/31.
//
import Foundation

public extension Int{
    var ms: TimeInterval { return UtilKTimeInterval.get(self)/1000  }
    var seconds: TimeInterval { return UtilKTimeInterval.get(self) }
    var minutes: TimeInterval { return UtilKTimeInterval.get(self * 60) }
    var hours: TimeInterval { return UtilKTimeInterval.get(self * 3600) }
    var days: TimeInterval { return UtilKTimeInterval.get(self * 86400) }
}

public final class UtilKTimeInterval{
    public static func get(_ v: Int)->TimeInterval{
        return TimeInterval.init(v)
    }
}
