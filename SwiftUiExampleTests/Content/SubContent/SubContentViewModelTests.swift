//
//  SubContentViewModelTests.swift
//  SwiftUiExampleTests
//
//  Created by Marius Wichtner on 10.01.21.
//

import XCTest
import RxSwift
@testable import SwiftUiExample


class SubContentViewModelTests: XCTestCase {
    let contentServiceMock: ContentServiceProtocolMock = ContentServiceProtocolMock()

    func test_onClickSubView_fetches_name_from_service_and_appends_it_to_specialText() throws {
        // arrange
        let mockedContent = Content(userId: 1, id: 1, title: "sourcery mocked", completed: false)
        contentServiceMock.getNameDefaultArgReturnValue = .just(mockedContent)
        contentServiceMock.someExtensionReturnValue = "mocked extension return value"
        let contentViewModel = SubContentViewModel(contentService: contentServiceMock)
        // act
        contentViewModel.onClickSubView()
        contentViewModel.onClickSubView()
        // assert
        XCTAssertEqual(contentViewModel.specialText, "sourcery mockedsourcery mocked")
        XCTAssertEqual(contentServiceMock.getNameDefaultArgCalled, true)
        XCTAssertEqual(contentServiceMock.getNameDefaultArgReceivedDefaultArg, "some sample arg")
    }
}
