//
//  Service.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 09.01.21.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

// sourcery: AutoMockable
protocol ContentServiceProtocol {
    func getName() -> Observable<Content>
    func getName(defaultArg: String) -> Observable<Content>
    func someExtension() -> String
}


extension ContentServiceProtocol {
    func someExtension() -> String {
        return "some extension value"
    }
}

struct ContentService: ContentServiceProtocol {
    func getName() -> Observable<Content> {
        return getName(defaultArg: "defaultArg")
    }
    func getName(defaultArg: String) -> Observable<Content> {
        return requestDecodable(.get, "https://jsonplaceholder.typicode.com/todos/1").map { $0.1 }
    }
}
