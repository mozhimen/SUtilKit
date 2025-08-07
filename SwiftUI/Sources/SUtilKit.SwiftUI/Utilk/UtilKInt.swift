//
//  UtilKInt.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/18.
//
import Foundation

public extension Int{
    func int2string()->String{
        return UtilKInt.int2string( self)
    }
}

public final class UtilKInt{
    public static func intCeil(a:Int,b:Int)->Int{
        return Int(ceil(Double(a)/Double(b)))
    }
    
    public static func int2string(_ int:Int)->String{
        return String(int)
    }
}
