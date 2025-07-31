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
}

public extension String{
    func strDate2date(strFormatDate:String,timeZone:TimeZone? = nil) ->Date?{
        return UtilKDate.strDate2date(strDate: self, strFormatDate: strFormatDate, timeZone: timeZone)
    }
}

public final class UtilKDate {
    public static func strDate2date(strDate:String,strFormatDate:String,timeZone:TimeZone?=nil)->Date?{
        return UtilKDateFormatterWrapper.get(pattern: strFormatDate,timeZone: timeZone).date(from: strFormatDate)
    }
}

struct v:View {
    var body: some View {
        Text("1")
            .onAppear(perform: {
                let res = Date()+12.ms
            })
    }
}
