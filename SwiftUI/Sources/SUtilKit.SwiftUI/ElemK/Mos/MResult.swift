//
//  MResult.swift
//  SUtilKit
//
//  Created by Taiyou on 2025/7/9.
//

public struct MResultIST<T:Decodable> : Decodable {
    public let code: Int?
    public let msg: String?
    public let t: T?

    public init(code: Int?, msg: String?, t: T?) {
        self.code = code
        self.msg = msg
        self.t = t
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(MResultIST.self) {
            self = value
        } else {
            self = MResultIST(code: 0, msg: nil, t: nil)
        }
    }
}
