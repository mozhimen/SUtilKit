//
//  UtilKInsecure.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/9/16.
//
import Foundation
import CryptoKit

public extension String {
    func str2strMd5_32()->String{
        return UtilKInsecure.str2strMd5_32(self)
    }
}

public final class UtilKInsecure{
    public static func str2strMd5_32(_ str:String)->String{
        // 将字符串转换为 UTF-8 数据
        let inputData = Data(str.utf8)
        
        // 使用 CryptoKit 计算 MD5 哈希
        let hash = Insecure.MD5.hash(data: inputData)
        
        // 将哈希字节数组转换为十六进制字符串
        return hash.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
