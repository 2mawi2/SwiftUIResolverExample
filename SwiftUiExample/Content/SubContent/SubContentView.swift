//
//  SubContentView.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 10.01.21.
//

import SwiftUI
import Resolver


struct SubContentView: View {
    @StateObject var subContentViewModel: SubContentViewModel = Resolver.resolve()

    let subViewText: String

    private func getSubContentViewText() -> String {
        return subViewText + subContentViewModel.specialText
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
                .onTapGesture {
                    subContentViewModel.onClickSubView()
                }
            Text(getSubContentViewText())
                .bold()
        }
    }
}


struct SubContentView_Previews: PreviewProvider {
    static var previews: some View {
        SubContentView(subViewText: "preview text")
    }
}
