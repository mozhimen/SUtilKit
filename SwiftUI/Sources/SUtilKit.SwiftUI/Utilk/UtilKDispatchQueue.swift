//
//  UtilKDispatchQueue.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/31.
//

import Foundation
public final class UtilKDispatchQueue{
    public static func get(label: String, qos: DispatchQoS = .unspecified, attributes: DispatchQueue.Attributes = [], autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency = .inherit, target: DispatchQueue? = nil)->DispatchQueue{
        return DispatchQueue.init(label: label,qos:qos,attributes: attributes,autoreleaseFrequency: autoreleaseFrequency,target: target )
    }
}
