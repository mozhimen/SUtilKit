//
//  UtilKNSMutableString.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/1.
//
import Foundation
public extension NSMutableString{
    func isNotEmpty()->Bool{
        return UtilKNSMutableString.isNotEmpty(self)
    }
    
    func isEmpty()->Bool{
        return UtilKNSMutableString.isEmpty(self)
    }
}

public final class UtilKNSMutableString{
    public static func isNotEmpty(_ nsMutableString:NSMutableString)->Bool{
        return !isEmpty(nsMutableString)
    }
    
    public static func isEmpty(_ nsMutableString:NSMutableString)->Bool{
        return nsMutableString.length==0
    }
}
