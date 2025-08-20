//
//  UtilKView.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/18.
//
import SwiftUI
import Foundation

public extension View{
    @ViewBuilder
    func apply(
        if condition: Bool,
        then thenTransform: (Self) -> some View,
        else elseTransform: (Self) -> some View
    ) -> some View {
        if condition {
            thenTransform(self)
        } else {
            elseTransform(self)
        }
    }
    
    // 可选：提供只有 then 的版本
    @ViewBuilder
    func apply(
        if condition: Bool,
        then thenTransform: (Self) -> some View
    ) -> some View {
        if condition {
            thenTransform(self)
        } else {
            self
        }
    }

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
    
    func onBackSwiped(onSwipe: @escaping I_Listener) -> some View {
        return UtilKView.onBackSwiped(view: self, onSwipe: onSwipe)
    }
}

public final class UtilKView{
    @MainActor
    public static func onDebouncedTap<V:View>(view:V,interval:TimeInterval=0.5,action: @escaping I_Listener)->some View{
        view
            .modifier(DebouncedTapModifier(timeInterval: interval, action: action))
    }
    
    public static func debugBorder<V:View>(view: V) -> some View  {
//#if DEBUG
//        return view
//            .border(UtilKColor.get_random(), width: 1)
//#else
        return view
//#endif
    }
    
    public static func debugBackground<V:View>(view: V) -> some View  {
//#if DEBUG
//        return view.background(UtilKColor.get_random())
//#else
        return view
//#endif
    }
    
    public static func onHeightChanged<V:View>(view: V, onChange: @escaping IA_Listener<CGFloat>) -> some View {
        view
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            onChange(geometry.size.height)
                        }
                }
            )
    }
    
    @MainActor
    public static func onBackSwiped<V:View>(view:V,onSwipe: @escaping I_Listener) -> some View {
        view.gesture(
            DragGesture()
                .onEnded({ value in
                    if value.startLocation.x < 50 && value.translation.width > 80 {
                        onSwipe()
                    }
                })
        )
    }
}
