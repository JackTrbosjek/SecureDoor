//===--- Result.swift -----------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//
// RUN: %target-run-stdlib-swift
// REQUIRES: executable_test
public enum Result<Value> {
    case Success(Value)
    case Error(Error)
    
    init(success x: Value) {
        self = .Success(x)
    }
    
    init(error: Error) {
        self = .Error(error)
    }
    
    func map<U>(_ transform: (Value) -> U) -> Result<U> {
        switch self {
        case .Success(let x): return .Success(transform(x))
        case .Error(let e): return .Error(e)
        }
    }
    
    func flatMap<U>(_ transform: (Value) -> Result<U>) -> Result<U> {
        switch self {
        case .Success(let x): return transform(x)
        case .Error(let e): return .Error(e)
        }
    }
    
    func get() throws -> Value {
        switch self {
        case .Success(let x): return x
        case .Error(let e): throw e
        }
    }
    
    var success: Value? {
        switch self {
        case .Success(let x): return x
        case .Error: return nil
        }
    }
    
    var error: Error? {
        switch self {
        case .Success: return nil
        case .Error(let x): return x
        }
    }
}

public func ?? <T> (
    result: Result<T>, defaultValue: @autoclosure () -> T
    ) -> T {
    switch result {
    case .Success(let x): return x
    case .Error: return defaultValue()
    }
}

/// Translate the execution of a throwing closure into a Result
func catchResult<Success>(
    invoking body: () throws -> Success
    ) -> Result<Success> {
    do {
        return try .Success(body())
    }
    catch {
        return .Error(error)
    }
}
