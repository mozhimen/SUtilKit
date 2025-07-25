//
//  BaseViewModel.swift
//  SUtilKit.SwiftUI
//
//  Created by Taiyou on 2025/7/23.
//
import SwiftUI
import Combine
open class BaseViewModel:ObservableObject{
    open var viewModelScope = Set<AnyCancellable>()
    
    public init(){
        
    }
}
