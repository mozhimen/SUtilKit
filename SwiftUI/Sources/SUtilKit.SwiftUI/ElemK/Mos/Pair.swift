//
//  Pair.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/28.
//

public struct Pair<T1, T2>:@unchecked Sendable {
    public var first: T1
    public var second: T2
    
    public init(_ first: T1,_ second: T2) {
        self.first = first
        self.second = second
    }
}
