//
//  AppDelegate+Injection.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 09.01.21.
//

import Foundation
import Resolver


extension Resolver: ResolverRegistering {
    private static func registerContentServices() {
        register { ContentService() as ContentServiceProtocol }
        
        register { ContentViewModel(service: resolve()) }
        register { SubContentViewModel(contentService: resolve()) }
    }
    
    public static func registerAllServices() {
        registerContentServices()
    }
}
