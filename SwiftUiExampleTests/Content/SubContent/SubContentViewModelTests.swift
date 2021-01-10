//
//  SubContentViewModelTests.swift
//  SwiftUiExampleTests
//
//  Created by Marius Wichtner on 10.01.21.
//

import XCTest
@testable import SwiftUiExample


class SubContentViewModelTests: XCTestCase {
    let contentServiceMock: MockContentService = MockContentService()

    func test_onClickSubView_fetches_name_from_service_and_appends_it_to_specialText() throws {
        // arrange
        let contentViewModel = SubContentViewModel(contentService: contentServiceMock)
        // act
        contentViewModel.onClickSubView()
        contentViewModel.onClickSubView()
        // assert
        XCTAssertEqual(contentViewModel.specialText, "mocked namemocked name")
    }
}
