//
//  UtilKInt.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/18.
//
import Foundation

public final class UtilKInt{
    public static func intCeil(a:Int,b:Int)->Int{
        return Int(ceil(Double(a)/Double(b)))
    }
}
