//
//  UtilKURLResponse.swift
//  SUtilKit
//
//  Created by Taiyou on 2025/7/10.
//
import Foundation

public extension URLResponse {
    func uRLResponse2str(data:Data?,error:Error?)->String{
        return UtilKURLResponse.uRLResponse2str(uRLResponse: self, data: data, error: error)
    }
}

public final class UtilKURLResponse {
    public static func uRLResponse2str(uRLResponse:URLResponse?,data:Data?,error:Error?)->String{
        var descriptions = [] as [String]
        
        descriptions.append("Response----------<")
        
        if let description = uRLResponse?.description {
            descriptions.append("Description: \(description)")
        }
        
        if let error {
            descriptions.append("Error: \(error.localizedDescription)")
        }else{
            descriptions.append("Body: \(String.init(data: data ?? Data(), encoding: .utf8) ?? "")")
        }
        
        descriptions.append("Response----------<")
        
        return descriptions.joined(separator: "\n")
    }
}

