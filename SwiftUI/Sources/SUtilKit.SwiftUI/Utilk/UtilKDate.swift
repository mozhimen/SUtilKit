//
//  UtilKDate.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/31.
//
import Foundation
import SwiftUI

public extension Date{
    // 运算符重载
    static func + (lhs: Date, rhs: TimeInterval) -> Date {
        lhs.addingTimeInterval(rhs)
    }
    
    static func - (lhs: Date, rhs: TimeInterval) -> Date {
        lhs.addingTimeInterval(-rhs)
    }
    
    // 计算两个 Date 的时间差（返回秒数）
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSince(rhs)
    }
    
    func date2doubleDate()->Double{
        return UtilKDate.date2doubleDate(date: self)
    }
}

public extension Int64{
    func int64Time2date()->Date?{
        return UtilKDate.int64Time2date(int64Time: self)
    }
    
    func int64Time2timeInterval()->TimeInterval{
        return UtilKDate.int64Time2timeInterval(int64Time: self)
    }
}

public extension String{
    func strTime2date()->Date?{
        return UtilKDate.strTime2date(strTime: self)
    }
    
    func strTime2int64Time()->Int64?{
        return UtilKDate.strTime2int64Time(strTime:self)
    }
    
    func strDate2date(strFormatDate:String,timeZone:TimeZone? = nil) ->Date?{
        return UtilKDate.strDate2date(strDate: self, strFormatDate: strFormatDate, timeZone: timeZone)
    }
}

public extension Double{
    func doubleDate2date()->Date{
        return UtilKDate.doubleDate2date(doubleDate: self)
    }
}

//

public final class UtilKDate {
    public static func get(timeIntervalSince1970: TimeInterval)->Date?{
        return Date.init(timeIntervalSince1970: timeIntervalSince1970)
    }
    
    //===========================================================>
    
    public static func doubleDate2date(doubleDate:Double)->Date{
        return Date.init(timeIntervalSince1970: doubleDate)
    }
    
    public static func date2doubleDate(date:Date)->Double{
        return date.timeIntervalSince1970
    }
    
    //数字13位时间戳转date
    public static func int64Time2date(int64Time:Int64)->Date?{
        return get(timeIntervalSince1970: int64Time.int64Time2timeInterval()/1000.0)//seconds
    }
    
    //数字13位时间戳转timeInterval
    public static func int64Time2timeInterval(int64Time:Int64)->TimeInterval{
        return UtilKTimeInterval.get(integerLiteral: int64Time)
    }
    
    //文本13位时间戳转date
    public static func strTime2date(strTime:String)->Date?{
        return strTime.strTime2int64Time()?.int64Time2date()
    }
    
    //13位时间戳转int64
    public static func strTime2int64Time(strTime:String)->Int64?{
        if !strTime.match_digits() {
            return nil
        }
        return UtilKInt64.get(strTime)
    }
    
    public static func strDate2date(strDate:String,strFormatDate:String,timeZone:TimeZone?=nil)->Date?{
        return UtilKDateFormatterWrapper.get(pattern: strFormatDate,timeZone: timeZone).date(from: strDate)
    }
}
