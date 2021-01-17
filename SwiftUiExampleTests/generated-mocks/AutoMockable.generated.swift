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

    //MARK: - getName

    var getNameDefaultArgCallsCount = 0
    var getNameDefaultArgCalled: Bool {
        return getNameDefaultArgCallsCount > 0
    }
    var getNameDefaultArgReceivedDefaultArg: String?
    var getNameDefaultArgReceivedInvocations: [String] = []
    var getNameDefaultArgReturnValue: Observable<Content>!
    var getNameDefaultArgClosure: ((String) -> Observable<Content>)?

    func getName(defaultArg: String) -> Observable<Content> {
        getNameDefaultArgCallsCount += 1
        getNameDefaultArgReceivedDefaultArg = defaultArg
        getNameDefaultArgReceivedInvocations.append(defaultArg)
        return getNameDefaultArgClosure.map({ $0(defaultArg) }) ?? getNameDefaultArgReturnValue
    }

    //MARK: - someExtension

    var someExtensionCallsCount = 0
    var someExtensionCalled: Bool {
        return someExtensionCallsCount > 0
    }
    var someExtensionReturnValue: String!
    var someExtensionClosure: (() -> String)?

    func someExtension() -> String {
        someExtensionCallsCount += 1
        return someExtensionClosure.map({ $0() }) ?? someExtensionReturnValue
    }

}
