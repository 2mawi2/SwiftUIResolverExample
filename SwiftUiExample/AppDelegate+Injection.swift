//
//  AppDelegate+Injection.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 09.01.21.
//

import Foundation
import Resolver


extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { ContentService() as ContentServiceProtocol }
        register { ContentViewModel(service: resolve()) }
    }
}
