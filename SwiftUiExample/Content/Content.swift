//
//  Content.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 13.01.21.
//

import Foundation

struct Content: Codable {
    public var userId: Int
    public var id: Int
    public var title: String
    public var completed: Bool

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
}
