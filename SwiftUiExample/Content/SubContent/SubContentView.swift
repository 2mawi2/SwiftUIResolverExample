//
//  SubContentView.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 10.01.21.
//

import SwiftUI
import Resolver
import RxSwift


struct SubContentView: View {
    @StateObject var viewModel: SubContentViewModel = Resolver.resolve()

    let subViewText: String

    private func getSubContentViewText() -> String {
        return subViewText + viewModel.specialText
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .onTapGesture {
                    viewModel.onClickSubView()
                }
            VStack {
                Text(getSubContentViewText())
                    .bold()
                if let content = viewModel.content {
                    HStack {
                        Text(content.id.description)
                        Text(content.userId.description)
                        Text(content.title)
                        Text(content.completed.description)
                    }
                   
                }
            }
        }.onAppear {
            viewModel.fetchContent()
        }
    }
}


struct SubContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let serviceMock = ContentServiceProtocolMock()
        let sampleContent = Content(userId: 1, id: 2, title: "title", completed: false)
        serviceMock.getNameReturnValue = .just(sampleContent)
        let viewModel = SubContentViewModel(contentService: serviceMock)
        return SubContentView(
            viewModel: viewModel,
            subViewText: "preview text"
        )
    }
}
