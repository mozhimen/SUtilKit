
//
//  UtilDispatchTimeInterval.swift
//  INetKit
//
//  Created by Taiyou on 2025/6/27.
//
import Foundation

// DispatchTimeInterval Extension for toDouble method
public extension DispatchTimeInterval {
    /// Convert to Double
    /// - Returns: Converted value
    func dispatchTimeInterval2double() -> Double? {
        return UtilKDispatchTimeInterval.dispatchTimeInterval2double(dispatchTimeInterval: self)
    }
    
    func toDispatchTimeInterval() -> DispatchTimeInterval {
        return UtilKDispatchTimeInterval.dispatchTimeInterval2dispatchTimeInterval(dispatchTimeInterval: self)
    }
}

public final class UtilKDispatchTimeInterval{
    public static func dispatchTimeInterval2double(dispatchTimeInterval:DispatchTimeInterval)-> Double? {
        switch dispatchTimeInterval {
        case .seconds(let value):
            return Double(value)
        case .milliseconds(let value):
            return Double(value) / 1000.0
        case .microseconds(let value):
            return Double(value) / 1_000_000.0
        case .nanoseconds(let value):
            return Double(value) / 1_000_000_000.0
        case .never:
            return nil
        @unknown default:
            return nil
        }
    }
    
    public static func dispatchTimeInterval2dispatchTimeInterval(dispatchTimeInterval:DispatchTimeInterval) -> DispatchTimeInterval {
        switch dispatchTimeInterval {
        case .seconds(let value):
            return .seconds(value)
        case .milliseconds(let value):
            return .milliseconds(value)
        case .microseconds(let value):
            return .microseconds(value)
        case .nanoseconds(let value):
            return .nanoseconds(value)
        case .never:
            return .never
        @unknown default:
            return .never
        }
    }
}
