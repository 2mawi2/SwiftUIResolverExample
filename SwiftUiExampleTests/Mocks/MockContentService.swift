//
//  MockContentService.swift
//  SwiftUiExampleTests
//
//  Created by Marius Wichtner on 10.01.21.
//

import Foundation
import RxSwift

@testable import SwiftUiExample

class MockContentService: ContentServiceProtocol {
    func getName() -> Observable<Content> {
        let content = Content(userId: 1, id: 1, title: "mocked rx swift observable", completed: false)
        return .just(content)
    }
}
