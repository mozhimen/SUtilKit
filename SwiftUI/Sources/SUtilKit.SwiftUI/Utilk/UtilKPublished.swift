//
//  UtilKPublished.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/19.
//
import Combine

public extension Published.Publisher {
    func mapAuto<T>(defaultValue: T,_ transform: @escaping IA_BListener<Output,T>) -> AnyPublisher<T, Never> {
        return self
            .map(transform)
            .prepend(defaultValue)
            .eraseToAnyPublisher()
    }
    
    func mapAuto<T>(_ transform: @escaping IA_BListener<Output,T>) -> AnyPublisher<T, Never> {
        return self
            .map(transform)
            .eraseToAnyPublisher()
    }
}

extension Published.Publisher: @unchecked Sendable where Output: Sendable { }

public final class UtilKPublished{
    
}
