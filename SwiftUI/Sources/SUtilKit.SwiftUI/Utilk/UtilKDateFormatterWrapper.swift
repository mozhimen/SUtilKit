//
//  UtilKDateFormatter.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/31.
//
import Foundation

public final class UtilKDateFormatterWrapper{
    nonisolated(unsafe) private static var _dateFormatters: [String: DateFormatter] = [:]
    private static let _queue = DispatchQueue(label: "com.mozhimen.sutilk.swift.UtilKDateFormatterWrapper", attributes: .concurrent)
    
    public static func get(pattern:String,timeZone:TimeZone? = nil) -> DateFormatter {
        let key = timeZone != nil ? "\(pattern)\(timeZone!)" : pattern
        // 读操作（并发）
        if let formatter = _queue.sync(execute: { _dateFormatters[key] }) {
            return formatter
        }
        // 写操作（屏障保护）
        return _queue.sync(flags: .barrier) {
            if let formatter = _dateFormatters[key] {
                return formatter
            }
            
            let formatter = UtilKDateFormatter.get()
            formatter.dateFormat = pattern
            formatter.timeZone = timeZone ?? UtilKTimeZone.get(secondsFromGMT: 0)
            _dateFormatters[key] = formatter
            return formatter
        }
    }
    
    public static func get_localized(dateStyle:DateFormatter.Style,timeStyle:DateFormatter.Style,locale:Locale,timeZone:TimeZone? = nil) -> DateFormatter {
        let key = timeZone != nil ? "\(dateStyle)\(timeStyle)\(locale)\(timeZone!)" : "\(dateStyle)\(timeStyle)\(locale)"
        // 读操作（并发）
        if let formatter = _queue.sync(execute: { _dateFormatters[key] }) {
            return formatter
        }
        // 写操作（屏障保护）
        return _queue.sync(flags: .barrier) {
            if let formatter = _dateFormatters[key] {
                return formatter
            }
            
            let formatter = UtilKDateFormatter.get()
            formatter.dateStyle = dateStyle
            formatter.timeStyle = timeStyle
            formatter.locale = locale
            formatter.timeZone = timeZone ?? UtilKTimeZone.get(secondsFromGMT: 0)
            _dateFormatters[key] = formatter
            return formatter
        }
    }
}

