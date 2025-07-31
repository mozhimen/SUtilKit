//
//  UtilKView.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/18.
//
import SwiftUI
import Foundation

public extension View{
    func debugBorder() -> some View {
        return UtilKView.debugBorder(view: self)
    }
}

public final class UtilKView{
    public static func debugBorder<V:View>(view: V) -> some View  {
#if DEBUG
        return view.border(UtilKColor.get_random(), width: 1)
#else
        return view
#endif
    }
}
