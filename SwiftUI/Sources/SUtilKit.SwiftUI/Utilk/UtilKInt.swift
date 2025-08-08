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
    
    func int2double()->Double{
        return UtilKInt.int2double(self)
    }
    
    func intBit2strNumberFormat()->String{
        return UtilKInt.intBit2strNumberFormat(self)
    }
}

public final class UtilKInt{
    public static func intCeil(a:Int,b:Int)->Int{
        return Int(ceil(Double(a)/Double(b)))
    }
    
    public static func int2string(_ int:Int)->String{
        return String(int)
    }
    
    public static func int2double(_ int:Int)->Double{
        return Double(int)
    }
    
    public static func intBit2strNumberFormat(_ intBit: Int) -> String {
        var pattern = "#."
        pattern += String(repeating: "0", count: intBit)
        return pattern
    }
}
