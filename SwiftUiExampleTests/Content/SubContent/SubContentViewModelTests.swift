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
    var contentServiceMock: ContentServiceProtocolMock = ContentServiceProtocolMock()

    override func setUp() {
        contentServiceMock = ContentServiceProtocolMock()
    }

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
    
    func test_fetchContent_should_filter_incomplete_content() throws {
        // arrange
        let notCompletedContent = Content(userId: 1, id: 1, title: "", completed: false)
        contentServiceMock.getNameReturnValue = .just(notCompletedContent)
        let contentViewModel = SubContentViewModel(contentService: contentServiceMock)
        // act
        contentViewModel.fetchContent()
        // assert
        XCTAssertNil(contentViewModel.content)
    }
    
    func test_fetchContent_should_accept_complete_content() throws {
        // arrange
        let notCompletedContent = Content(userId: 1, id: 1, title: "", completed: true)
        contentServiceMock.getNameReturnValue = .just(notCompletedContent)
        let contentViewModel = SubContentViewModel(contentService: contentServiceMock)
        // act
        contentViewModel.fetchContent()
        // assert
        XCTAssertNotNil(contentViewModel.content)
        XCTAssertEqual(contentViewModel.content?.id, notCompletedContent.id)
    }
}
