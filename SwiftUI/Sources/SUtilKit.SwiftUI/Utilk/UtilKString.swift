//
//  UtilKString.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/16.
//
import Foundation

public extension String{
    func match_digits()->Bool{
        return UtilKString.match_digits(self)
    }
    
    func isNotEmpty()->Bool{
        return UtilKString.isNotEmpty(self)
    }
    //===========================================================>
    
    func substring_sta_separator() -> String {
        return UtilKString.substring_sta_separator(self)
    }
    
    func substring_sta(prefix: String) -> String {
        return UtilKString.substring_sta(self, prefix: prefix)
    }
    
    //===========================================================>
    
    func startsWith(prefix: String, ignoreCase: Bool = false)->Bool {
        return UtilKString.startsWith(self, prefix: prefix, ignoreCase: ignoreCase)
    }
    
    func endsWith(suffix: String, ignoreCase: Bool = false)->Bool {
        return UtilKString.endsWith(self, suffix: suffix, ignoreCase: ignoreCase)
    }
    
    func substring(startIndex: Int) -> String {
        return UtilKString.substring(self, startIndex: startIndex)
    }
    
    func substring(startIndex: Int, endIndex: Int) -> String {
        return UtilKString.substring(self, startIndex: startIndex, endIndex: endIndex)
    }
    
    func substring(range: Range<Int>) -> String {
        return UtilKString.substring(self, range: range)
    }
    
    //===========================================================>
    
    func hideAll()->String{
        return UtilKString.hideAll(self)
    }
}

public final class UtilKString{
    public static func match_digits(_ str:String)->Bool{
        return str.range(of: "^[0-9]+$",options: .regularExpression) != nil
    }
    
    public static func isNotEmpty(_ str:String)->Bool{
        return !str.isEmpty
    }
    
    //===========================================================>
    
    public static func substring_sta_separator(_ str: String) -> String {
        return substring_sta(str, prefix: "/")
    }
    
    public static func substring_sta(_ str: String, prefix: String) -> String {
        if str.startsWith(prefix: prefix) {
            return str.substring(startIndex: prefix.count)
        } else {
            return str
        }
    }
    
    public static func endsWith(_ str:String, suffix: String, ignoreCase: Bool = false) -> Bool {
        guard !suffix.isEmpty && suffix.count <= str.count else {
            return false
        }
        
        if !ignoreCase {
            return str.hasSuffix(suffix)
        }
        
        let start = str.index(str.endIndex, offsetBy: -suffix.count)
        let substring = str[start...]
        return substring.lowercased() == suffix.lowercased()
    }
    
    /// Swift 版本的 startsWith 函数
    /// - Parameters:
    ///   - prefix: 要检查的前缀字符串
    ///   - ignoreCase: 是否忽略大小写，默认为 false
    /// - Returns: 如果字符串以指定前缀开头则返回 true
    public static func startsWith(_ str: String, prefix: String, ignoreCase: Bool = false) -> Bool {
        if ignoreCase {
            return str.lowercased().hasPrefix(prefix.lowercased())
        } else {
            return str.hasPrefix(prefix)
        }
    }
    
    /// substring(startIndex: Int)
    public static func substring(_ str: String, startIndex: Int) -> String {
        let index = str.index(str.startIndex, offsetBy: startIndex)
        return String(str[index...])
    }
    
    /// substring(startIndex: Int, endIndex: Int)
    public static func substring(_ str: String, startIndex: Int, endIndex: Int) -> String {
        let start = str.index(str.startIndex, offsetBy: startIndex)
        let end = str.index(str.startIndex, offsetBy: endIndex)
        return String(str[start..<end])
    }
    
    /// substring(range: Range<Int>)
    public static func substring(_ str: String, range: Range<Int>) -> String {
        let start = str.index(str.startIndex, offsetBy: range.lowerBound)
        let end = str.index(str.startIndex, offsetBy: range.upperBound)
        return String(str[start..<end])
    }
    
    //===========================================================>
    
    /**
     * 密码脱敏（将所有字符替换为指定字符）
     * - Parameters:
     *   - str: 原始字符串
     *   - char: 替换字符，默认为'*'
     * - Returns: 脱敏后的字符串
     */
    public static func hideAll(_ str: String, char: Character = "*") -> String {
        guard !str.isEmpty else {
            return ""
        }
        return String(repeating: String(char), count: str.count)
    }
}
