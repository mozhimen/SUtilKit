//
//  UtilKDateFormatterFormat.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/8.
//
import Foundation

public extension Double{
    func getStrDecimal(bit:Int)->String?{
        return UtilKNumberFormatterFormat.getStrDecimal(double: self, bit: bit)
    }
    
    func getStrDecimal(bit:Int,locale:Locale)->String?{
        return UtilKNumberFormatterFormat.getStrDecimal(double: self, bit: bit, locale: locale)
    }
    
    //======================================================>
    
    func getStrDecimal_2()->String?{
        return UtilKNumberFormatterFormat.getStrDecimal_2(double: self)
    }
    
    func getStrDecimal_2(locale:Locale)->String?{
        return UtilKNumberFormatterFormat.getStrDecimal_2(double: self, locale: locale)
    }
}

public final class UtilKNumberFormatterFormat{
    public static func getStrDecimal(double:Double,bit:Int)->String?{
        return UtilKNumberFormatterWrapper.get(bit: bit).string(from: double.double2nSNumber())
    }
    
    public static func getStrDecimal(double:Double,bit:Int,locale:Locale)->String?{
        return UtilKNumberFormatterWrapper.get(bit: bit,locale: locale).string(from: double.double2nSNumber())
    }
    
    //======================================================>
    
    public static func getStrDecimal_2(double:Double)->String?{
        return getStrDecimal(double: double, bit: 2)
    }
    
    public static func getStrDecimal_2(double:Double,locale:Locale)->String?{
        return getStrDecimal(double: double, bit: 2,locale: locale)
    }
}
