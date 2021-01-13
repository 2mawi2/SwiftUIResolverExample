//
//  ContentViewModel.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 09.01.21.
//

import Foundation
import RxSwift

class ContentViewModel: ObservableObject {
    let service: ContentServiceProtocol
    let disposeBag = DisposeBag()

    @Published var text: String = "initial value"

    init(
        service: ContentServiceProtocol
    ) {
        self.service = service
    }

    func onClickChangeValue() {
        service
            .getName()
            .subscribe(onNext: { self.text = $0.title })
            .disposed(by: self.disposeBag)
    }
}
