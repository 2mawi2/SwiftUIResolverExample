// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
import RxSwift
#elseif os(OSX)
import AppKit
#endif














class ContentServiceProtocolMock: ContentServiceProtocol {

    //MARK: - getName

    var getNameCallsCount = 0
    var getNameCalled: Bool {
        return getNameCallsCount > 0
    }
    var getNameReturnValue: Observable<Content>!
    var getNameClosure: (() -> Observable<Content>)?

    func getName() -> Observable<Content> {
        getNameCallsCount += 1
        return getNameClosure.map({ $0() }) ?? getNameReturnValue
    }

}
