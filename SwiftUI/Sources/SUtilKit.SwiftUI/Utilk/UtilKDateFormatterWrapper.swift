//
//  UtilKDateFormatter.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/31.
//
import Foundation

public final class UtilKDateFormatterWrapper{
    // 单例实例
    public nonisolated(unsafe) static let shared = UtilKDateFormatterWrapper()
    
    //===================================================================>
    
    private var _dateFormatters: [String: DateFormatter] = [:]
    private let _lock = NSLock()
    
    //===================================================================>
    
    // 私有化初始化方法
    public init() {}
    
    //===================================================================>
    
    public static func get(pattern:String, timeZone:TimeZone? = nil) -> DateFormatter{
        return shared.get(pattern: pattern,timeZone: timeZone)
    }
    
    public static func get_localized(dateStyle:DateFormatter.Style,timeStyle:DateFormatter.Style,locale:Locale,timeZone:TimeZone? = nil) -> DateFormatter {
        return shared.get_localized(dateStyle: dateStyle, timeStyle: timeStyle, locale: locale, timeZone: timeZone)
    }
    
    //===================================================================>
    
    public func get(pattern:String, timeZone:TimeZone? = nil) -> DateFormatter {
        let key = timeZone != nil ? "\(pattern)\(timeZone!)" : pattern
        
        _lock.lock()
        defer { _lock.unlock() }
        
        // 读操作（并发）
        if let formatter = _dateFormatters[key] {
            return formatter
        }
        
        // 写操作（屏障保护）
        let formatter = UtilKDateFormatter.get()
        formatter.dateFormat = pattern
        formatter.timeZone = timeZone ?? UtilKTimeZone.get(secondsFromGMT: 0)
        _dateFormatters[key] = formatter
        return formatter
    }
    
    public func get_localized(dateStyle:DateFormatter.Style,timeStyle:DateFormatter.Style,locale:Locale,timeZone:TimeZone? = nil) -> DateFormatter {
        let key = timeZone != nil ? "\(dateStyle)\(timeStyle)\(locale)\(timeZone!)" : "\(dateStyle)\(timeStyle)\(locale)"
        
        _lock.lock()
        defer { _lock.unlock() }
        
        // 读操作（并发）
        if let formatter = _dateFormatters[key] {
            return formatter
        }
        
        // 写操作（屏障保护）
        let formatter = UtilKDateFormatter.get()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        formatter.locale = locale
        formatter.timeZone = timeZone ?? UtilKTimeZone.get(secondsFromGMT: 0)
        _dateFormatters[key] = formatter
        return formatter
    }
    
    // MARK: - 清理缓存
    /// 清理所有缓存的DateFormatter
    func clear() {
        _lock.lock()
        defer { _lock.unlock() }
        _dateFormatters.removeAll()
    }
    
    /// 清理特定key的DateFormatter
    func remove(key: String) {
        _lock.lock()
        defer { _lock.unlock() }
        _dateFormatters.removeValue(forKey: key)
    }
}

