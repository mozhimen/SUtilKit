//
//  UtilKURLResponse.swift
//  SUtilKit
//
//  Created by Taiyou on 2025/7/10.
//
import Foundation

public func uRLResponse2str(uRLResponse:URLResponse?,data:Data?,error:Error?)->String{
    var descriptions = [] as [String]
    
    descriptions.append("Response:")
    
    if let description = uRLResponse?.description {
        descriptions.append(description)
    }
    
    if let error {
        descriptions.append("Error: \(error.localizedDescription)")
    }else{
        descriptions.append("Body: \(String.init(data: data ?? Data(), encoding: .utf8) ?? "")")
    }
    
    return descriptions.joined(separator: "\n")
}
