//
//  UtilK Sequence.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/21.
//

public extension Sequence {
    // 类似 Kotlin 的 filterNot
    func filterNot(_ predicate: IA_BListener<Element,Bool>) -> [Element] {
        return UtilKSequence.filterNot(sequence: self, predicate)
    }
}

public final class UtilKSequence{
    public static func filterNot<T>(sequence:any Sequence<T>,_ predicate: IA_BListener<T,Bool>) -> [T] {
        return sequence.filter { !predicate($0) }
    }
}
