//
//  DebouncedTapModifier.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/8/1.
//
import SwiftUI
import Foundation

public struct DebouncedTapModifier:ViewModifier{
    let timeInterval:TimeInterval
    let action:I_Listener
    
    @State private var _lastTapTime:Date = .distantPast
    
    public func body(content: Content) -> some View {
        content.onTapGesture(perform: {
            let now = Date()
            if now.timeIntervalSince(_lastTapTime) > timeInterval{
                _lastTapTime = now
                action()
            }
        })
    }
}
