//
//  SubContentViewModel.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 10.01.21.
//

import Foundation

class SubContentViewModel: ObservableObject {
    @Published var specialText: String = ""

    let contentService: ContentServiceProtocol

    init(contentService: ContentServiceProtocol) {
        self.contentService = contentService
    }

    func onClickSubView() {
        specialText = specialText + contentService.getName()
    }
}
