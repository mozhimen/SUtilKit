//
//  UtilKNSRegularExpressionWrapper.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/9/10.
//
import Foundation

public extension String{
    func matches_EMAIL_ADDRESS()->Bool{
        return UtilKNSRegularExpressionWrapper.matches_EMAIL_ADDRESS(strEmail: self)
    }
}

public final class UtilKNSRegularExpressionWrapper{
    
    public static func matches_EMAIL_ADDRESS(strEmail:String)->Bool{
        let range = NSRange(location: 0, length: strEmail.utf16.count)
        return CNSRegularExpression.EMAIL_ADDRESS.firstMatch(in: strEmail, options: [], range: range) != nil
    }
}


