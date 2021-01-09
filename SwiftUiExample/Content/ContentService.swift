//
//  Service.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 09.01.21.
//

import Foundation

protocol ContentServiceProtocol {
    func getName() -> String
}

struct ContentService : ContentServiceProtocol {
    func getName() -> String {
        return "this is a name"
    }
}
