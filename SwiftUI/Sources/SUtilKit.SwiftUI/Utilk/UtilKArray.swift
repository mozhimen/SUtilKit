//
//  UtilKArray.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/16.
//

public extension Array{
    func isNotEmpty<T>() -> Bool {
        return UtilKArray.isNotEmpty<T>(self)
    }
}

public final class UtilKArray{
    public static func isNotEmpty(array:Array)->Bool {
        return !array.isEmpty
    }
}
