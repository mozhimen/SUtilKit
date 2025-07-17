//
//  UtilKArray.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/16.
//

public extension Array {
    func isNotEmpty() -> Bool {
        return UtilKCollection.isNotEmpty(collection: self)
    }
}

public final class UtilKCollection {
    public static func isNotEmpty<T>(collection: [T]) -> Bool {
        return !collection.isEmpty
    }
}
