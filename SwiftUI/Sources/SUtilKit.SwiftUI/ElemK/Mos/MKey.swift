//
//  MKey.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/29.
//

public struct MKey:Identifiable{
    public let id:String
    public let name:String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
