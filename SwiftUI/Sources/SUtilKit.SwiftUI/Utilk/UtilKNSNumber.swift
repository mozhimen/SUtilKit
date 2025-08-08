//
//  UtilKNSNumber.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/8.
//
import Foundation

public extension Double{
    func double2nSNumber()->NSNumber{
        return UtilKNSNumber.double2nSNumber(self)
    }
}

public final class UtilKNSNumber{
    public static func double2nSNumber(_ double:Double)->NSNumber{
        return NSNumber(value: double)
    }
}
