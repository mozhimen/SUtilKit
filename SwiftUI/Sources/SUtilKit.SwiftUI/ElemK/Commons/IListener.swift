//
//  IListener.swift
//  SUtilKit
//
//  Created by Taiyou on 2025/7/9.
//
public typealias I_AListener<A> = () -> A
public typealias IA_BListener<A,B> = (A) -> B
public typealias IAB_CListener<A,B,C> = (A,B) -> C
