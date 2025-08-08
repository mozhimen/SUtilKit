//
//  UtilKNumberFormatterWrapper.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/8.
//

import Foundation

class UtilKNumberFormatterWrapper {
    // 单例实例
    public nonisolated(unsafe) static let shared = UtilKNumberFormatterWrapper()
    
    //=====================================================================>
    // 线程安全的缓存字典
    private let _lock = NSLock()
    private var _decimalFormats = [String: NumberFormatter]()
    
    //=====================================================================>
    
    public init() {} // 私有化初始化方法
    
    //=====================================================================>
    // MARK: - 公共方法
    
    /// 获取指定pattern的NumberFormatter
    public static func get(pattern: String) -> NumberFormatter {
        return shared.get(pattern: pattern, locale: UtilLocale.get())
    }
    
    /// 获取指定pattern和locale的NumberFormatter
    public static func get(pattern: String, locale: Locale) -> NumberFormatter {
        return shared.get(pattern: pattern, locale: locale)
    }
    
    /// 获取指定小数位数的NumberFormatter
    public static func get(bit: Int) -> NumberFormatter {
        return shared.get(bit: bit, locale: UtilLocale.get())
    }
    
    /// 获取指定小数位数和locale的NumberFormatter
    public static func get(bit: Int, locale: Locale) -> NumberFormatter {
        return shared.get(bit: bit, locale: locale)
    }
    
    //=====================================================================>
    /**
     在 NumberFormatter 中设置数字格式时，maximumFractionDigits/minimumFractionDigits 和直接设置 positiveFormat/negativeFormat 是两种不同的控制方式，它们的适用场景和效果有所不同。以下是详细对比和建议：

     1. 方法对比
     方法一：使用 maximumFractionDigits 和 minimumFractionDigits
     swift
     let formatter = NumberFormatter()
     formatter.numberStyle = .decimal
     formatter.minimumFractionDigits = 2  // 强制保留2位小数
     formatter.maximumFractionDigits = 2  // 最多2位小数
     效果：

     输入 1234.5 → 输出 "1,234.50"（补零）
     输入 1234.567 → 输出 "1,234.57"（四舍五入）
     输入 1234 → 输出 "1,234.00"（补零）

     ✅ 优点：
     简单直观：直接控制小数位数，无需手动写格式模板。
     自适应：自动处理正负数（无需单独配置）。
     本地化友好：配合 numberStyle 会根据用户的 Locale 显示（如欧洲用逗号分隔小数）。

     ❌ 缺点：
     无法自定义数字的整体格式（如千分位分隔符是否显示）。

     方法二：直接设置 positiveFormat/negativeFormat
     swift
     let formatter = NumberFormatter()
     formatter.positiveFormat = "#,##0.00"  // 正数格式
     formatter.negativeFormat = "-#,##0.00" // 负数格式
     效果：

     输入 1234.5 → 输出 "1,234.50"
     输入 -1234.5 → 输出 "-1,234.50"
     输入 1234 → 输出 "1,234.00"

     ✅ 优点：
     完全控制格式：可自定义千分位、正负数符号、小数点等。
     灵活性高：支持复杂格式（如货币符号位置、科学计数法等）。

     ❌ 缺点：
     硬编码格式：可能不兼容某些 Locale（如德语的千分位是 .，小数点是 ,）。
     维护成本高：需手动确保正负数格式一致。

     2. 如何选择？
     需求场景    推荐方法    示例
     只需控制小数位数    minimum/maximumFractionDigits    价格显示（固定2位小数）
     需要完全自定义格式    positiveFormat/negativeFormat    特殊格式如 +1.23; -1.23
     需要兼容多语言/本地化    minimum/maximumFractionDigits + numberStyle    根据用户地区自动适配格式
     需要科学计数法或货币符号    positiveFormat/negativeFormat    1.23E+5 或 $1,234.50
     3. 最佳实践建议
     优先使用 minimum/maximumFractionDigits：

     适用于大多数场景（如金额、百分比等）。

     代码更简洁，且兼容本地化。

     swift
     formatter.numberStyle = .decimal
     formatter.minimumFractionDigits = 2
     formatter.maximumFractionDigits = 2
     仅在需要完全控制格式时用 positiveFormat：

     例如：强制显示千分位或特殊符号。

     swift
     formatter.positiveFormat = "★#,##0.00;"
     formatter.negativeFormat = "▼#,##0.00;"
     注意本地化问题：

     如果使用硬编码格式（如 #,##0.00），在某些地区会显示异常：

     德国用户期望 1.234,56，但硬编码会输出 1,234.56。

     解决方案：

     swift
     formatter.locale = Locale.current // 根据用户设备自动适配
     4. 完整示例
     场景：显示价格（固定2位小数，兼容多语言）
     swift
     let priceFormatter = NumberFormatter()
     priceFormatter.numberStyle = .decimal
     priceFormatter.minimumFractionDigits = 2
     priceFormatter.maximumFractionDigits = 2
     priceFormatter.locale = Locale.current // 自动适配用户地区

     let price = 1234.5
     print(priceFormatter.string(from: NSNumber(value: price))
     // 美国: "1,234.50"
     // 德国: "1.234,50"
     // 法国: "1 234,50"
     场景：特殊格式（如带星号标记）
     swift
     let customFormatter = NumberFormatter()
     customFormatter.positiveFormat = "★#,##0.00;"
     customFormatter.negativeFormat = "▼#,##0.00;"

     let value = -1234.5
     print(customFormatter.string(from: NSNumber(value: value)))
     // 输出: "▼1,234.50"
     总结
     简单需求 → 用 minimum/maximumFractionDigits（更安全、更本地化友好）。

     复杂需求 → 用 positiveFormat/negativeFormat（需注意本地化问题）。

     如果不确定，优先选择第一种方法！
     */
    public func get(bit: Int, locale: Locale? = nil) -> NumberFormatter {
        let key = locale != nil ? "\(bit)\(locale!.identifier)" : "\(bit)"
        
        _lock.lock()
        defer { _lock.unlock() }
        
        if let cachedFormatter = _decimalFormats[key] {
            return cachedFormatter
        }
        
        let formatter = UtilKNumberFormatter.get()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = bit
        formatter.maximumFractionDigits = bit
        if locale != nil {
            formatter.locale = locale
        }
        
        _decimalFormats[key] = formatter
        return formatter
    }
    
    public func get(pattern: String, locale: Locale? = nil) -> NumberFormatter {
        let key = locale != nil ? "\(pattern)\(locale!.identifier)" : "\(pattern)"
        
        _lock.lock()
        defer { _lock.unlock() }
        
        if let cachedFormatter = _decimalFormats[key] {
            return cachedFormatter
        }
        
        let formatter = UtilKNumberFormatter.get()
        if locale != nil {
            formatter.locale = locale
        }
        formatter.positiveFormat = pattern
        formatter.negativeFormat = "-\(pattern)"
        formatter.roundingMode = .halfUp
        
        _decimalFormats[key] = formatter
        return formatter
    }
    
//    public func get(bit: Int, locale: Locale) -> NumberFormatter {
//        var pattern = "#."
//        pattern += String(repeating: "0", count: bit)
//        return get(pattern: pattern, locale: locale)
//    }
}
