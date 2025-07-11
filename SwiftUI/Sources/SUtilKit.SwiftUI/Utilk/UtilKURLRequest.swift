//
//  UtilKURLRequest.swift
//  SUtilKit
//
//  Created by Taiyou on 2025/7/10.
//
import Foundation

public extension URLRequest {
    func uRLRequest2str()-> String {
        var descriptions = [] as [String]

        descriptions.append("Request:")

        if let httpMethod {
            descriptions.append("Method: \(httpMethod)")
        }

        if let url {
            descriptions.append("URL: \(url)")
        }

        if let allHTTPHeaderFields, !allHTTPHeaderFields.isEmpty {
            descriptions.append("Headers: \(allHTTPHeaderFields)")
        }

        if let httpBody, let bodyDescription = String(data: httpBody, encoding: .utf8) {
            descriptions.append("Body: \(bodyDescription)")
        }

        return descriptions.joined(separator: "\n")
    }
}
