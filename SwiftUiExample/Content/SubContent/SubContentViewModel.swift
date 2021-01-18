//
//  SubContentViewModel.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 10.01.21.
//

import Foundation
import RxSwift

class SubContentViewModel: ObservableObject {
    let contentService: ContentServiceProtocol
    let disposeBag = DisposeBag()

    @Published var specialText: String = ""
    @Published var content: Content? = nil

    init(contentService: ContentServiceProtocol) {
        self.contentService = contentService
    }

    func onClickSubView() {
        contentService
            .getName(defaultArg: "some sample arg")
            .subscribe(onNext: { content in
            self.content = content
            self.specialText = self.specialText + content.title
        }).disposed(by: disposeBag)
    }

    func fetchContent() {
        contentService
            .getName()
            .filter { $0.completed }
            .subscribe(onNext: { content in self.content = content })
            .disposed(by: disposeBag)
    }
}
