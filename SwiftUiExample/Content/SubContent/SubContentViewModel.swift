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

    init(contentService: ContentServiceProtocol) {
        self.contentService = contentService
    }

    func onClickSubView() {
        contentService
            .getName()
            .subscribe(onNext: { self.specialText = self.specialText + $0.title })
            .disposed(by: disposeBag)
    }
}
