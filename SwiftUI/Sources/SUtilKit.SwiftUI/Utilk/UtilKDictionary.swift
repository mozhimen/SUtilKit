//
//  UtilKDictionary.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/31.
//
import Foundation
public extension Dictionary{
    func containsKey(key:Key)->Bool{
        return UtilKDictionary.containsKey(dictionary: self, key: key)
    }
}

public final class UtilKDictionary{
    public static func containsKey<K,V>(dictionary:[K:V],key:K)->Bool{
        return dictionary.keys.contains(key)
    }
}
