//
//  BaseViewModel.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/23.
//
import SwiftUI
import Combine
open class BaseViewModel:ObservableObject,@unchecked Sendable{

    @MainActor
    open var viewModelScope = Set<AnyCancellable>()
    
    @MainActor
    public init(){
        
    }
}
