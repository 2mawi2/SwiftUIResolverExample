//
//  ContentView.swift
//  SwiftUiExample
//
//  Created by Marius Wichtner on 09.01.21.
//

import SwiftUI
import CoreData
import Resolver


struct ContentView: View {
    @ObservedObject var contentViewModel: ContentViewModel = Resolver.resolve()

    var body: some View {
        Text(contentViewModel.text)
        Button("change value", action: {
            contentViewModel.onClickChangeValue()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
