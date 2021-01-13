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

protocol ContentServiceProtocol {
    func getName() -> Observable<Content>
}

struct ContentService: ContentServiceProtocol {
    func getName() -> Observable<Content> {
        return requestDecodable(.get, "https://jsonplaceholder.typicode.com/todos/1").map { $0.1 }
    }
}
