//
//  UtilKView.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/18.
//
import SwiftUI
import Foundation

public extension View{
    func onDebouncedTap(interval:TimeInterval=0.5,action: @escaping I_Listener) -> some View{
        return UtilKView.onDebouncedTap(view: self, interval: interval, action: action)
    }
    
    func debugBorder() -> some View {
        return UtilKView.debugBorder(view: self)
    }
    
    func debugBackground() -> some View {
        return UtilKView.debugBackground(view: self)
    }
    
    func onHeightChanged(onChange: @escaping IA_Listener<CGFloat>) -> some View {
        return UtilKView.onHeightChanged(view: self, onChange: onChange)
    }
}

public final class UtilKView{
    @MainActor
    public static func onDebouncedTap<V:View>(view:V,interval:TimeInterval=0.5,action: @escaping I_Listener)->some View{
        view.modifier(DebouncedTapModifier(timeInterval: interval, action: action))
    }
    
    public static func debugBorder<V:View>(view: V) -> some View  {
#if DEBUG
        return view.border(UtilKColor.get_random(), width: 1)
#else
        return view
#endif
    }
    
    public static func debugBackground<V:View>(view: V) -> some View  {
#if DEBUG
        return view.background(UtilKColor.get_random())
#else
        return view
#endif
    }
    
    public static func onHeightChanged<V:View>(view: V, onChange: @escaping IA_Listener<CGFloat>) -> some View {
        view.background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        onChange(geometry.size.height)
                    }
            }
        )
    }
}
