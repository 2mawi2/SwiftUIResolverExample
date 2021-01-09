//
//  ContentViewModel.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 09.01.21.
//

import Foundation


class ContentViewModel: ObservableObject {
    let service: ContentServiceProtocol
    
    @Published var text: String = "initial value"
    
    init(
        service: ContentServiceProtocol
    ) {
        self.service = service
    }
    
    func onClickChangeValue(){
        let newValue = service.getName()
        text = newValue
    }
}
