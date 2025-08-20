//
//  UtilKArray.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/16.
//

public extension Array {
    func getOrNull(_ index: Int)->Element? {
        return UtilKCollection.getOrNull(index, collection: self)
    }
    
    func isNotEmpty() -> Bool {
        return UtilKCollection.isNotEmpty(collection: self)
    }
    
    func isNullOrEmpty() -> Bool {
        return UtilKCollection.isNullOrEmpty(collection: self)
    }
}

public final class UtilKCollection {
    public static func isNotEmpty<T>(collection: [T]) -> Bool {
        return !collection.isEmpty
    }
    
    public static func isNullOrEmpty<T>(collection: [T]?) -> Bool {
        return collection == nil || collection?.isEmpty == true
    }
    
    // 确保所有数组访问都有边界检查
    public static func getOrNull<T>(_ index: Int,collection: [T]) -> T? {
        guard index >= 0 && index < collection.count else { return nil }
        return collection[index]
    }
}
