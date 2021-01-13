
import XCTest
import RxSwift
@testable import SwiftUiExample

class ContentViewModelTests: XCTestCase {
    let contentServiceMock: MockContentService = MockContentService()

    func test_onClickChangeValue_fetches_name_from_service_and_replaces_text() throws {
        // arrange
        let contentViewModel = ContentViewModel(service: contentServiceMock)
        // act
        contentViewModel.onClickChangeValue()
        // assert
        XCTAssertEqual(contentViewModel.text, "mocked rx swift observable")
    }
}
