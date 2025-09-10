//
//  IListener.swift
//  SUtilKit
//
//  Created by Taiyou on 2025/7/9.
//
public typealias I_Listener = () -> Void
public typealias IA_Listener<A> = (A) -> Void
public typealias I_AListener<A> = () -> A
public typealias IA_AListener<A> = (A) -> A
public typealias IA_BListener<A,B> = (A) -> B
public typealias IAB_Listener<A,B> = (A,B) -> Void
public typealias IAB_CListener<A,B,C> = (A,B) -> C
public typealias IABC_DListener<A,B,C,D> = (A,B,C) -> D
