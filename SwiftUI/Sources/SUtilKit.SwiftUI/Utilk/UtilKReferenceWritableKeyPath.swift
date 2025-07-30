//
//  UtilKReferenceWritableKeyPath.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/30.
//

// 扩展：获取 KeyPath 对应的属性名
import SwiftUI

public extension ReferenceWritableKeyPath {
    var propertyName: String {
        NSExpression(forKeyPath: self).keyPath
    }
}
