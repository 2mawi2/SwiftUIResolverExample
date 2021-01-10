//
//  MockContentService.swift
//  SwiftUiExampleTests
//
//  Created by Marius Wichtner on 10.01.21.
//

import Foundation
@testable import SwiftUiExample

class MockContentService: ContentServiceProtocol {
    func getName() -> String {
        return "mocked name"
    }
}
