//
//  UtilKURLRequest.swift
//  SUtilKit
//
//  Created by Taiyou on 2025/7/10.
//
import Foundation

public extension URLRequest {
    func uRLRequest2str()-> String {
        return UtilKURLRequest.uRLRequest2str(uRLRequest: self)
    }
}

public final class UtilKURLRequest {
    public static func uRLRequest2str(uRLRequest: URLRequest)-> String {
        var descriptions = [] as [String]

        descriptions.append("Request---------->")

        if let httpMethod = uRLRequest.httpMethod {
            descriptions.append("Method: \(httpMethod)")
        }

        if let url = uRLRequest.url {
            descriptions.append("URL: \(url)")
        }

        if let allHTTPHeaderFields = uRLRequest.allHTTPHeaderFields, !allHTTPHeaderFields.isEmpty {
            descriptions.append("Headers: \(allHTTPHeaderFields)")
        }

        if let httpBody = uRLRequest.httpBody, let bodyDescription = String(data: httpBody, encoding: .utf8) {
            descriptions.append("Body: \(bodyDescription)")
        }

        descriptions.append("Request---------->")
        
        return descriptions.joined(separator: "\n")
    }
}
