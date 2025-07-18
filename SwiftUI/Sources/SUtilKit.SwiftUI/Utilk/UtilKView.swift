//
//  UtilKView.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/18.
//
import SwiftUI

public extension View{
    func debugBorder() -> some View {
#if DEBUG
        return self.border(UtilKColor.get_random(), width: 1)
#else
        return self
#endif
    }
}
