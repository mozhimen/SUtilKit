//
//  UtilKDouble.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/7.
//

public extension Double{
    func double2string()->String {
        return UtilKDouble.double2stirng(self)
    }
}

public final class UtilKDouble{
    public static func double2stirng(_ double:Double)->String{
        return String(double)
    }
}
