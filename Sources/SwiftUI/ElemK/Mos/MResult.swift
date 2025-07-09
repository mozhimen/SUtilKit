//
//  MResult.swift
//  SUtilKit
//
//  Created by Taiyou on 2025/7/9.
//

public struct MResultIST<T> {
    let code: Int
    let msg: String?
    let bean: T

    public init(code: Int, msg: String?, t: T) {
        self.code = code
        self.msg = msg
        self.t = t
    }
}
