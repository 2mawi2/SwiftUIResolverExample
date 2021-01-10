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
        
        VStack {
            Text(contentViewModel.text)
            Button("change value", action: {
                contentViewModel.onClickChangeValue()
            })
            List {
                SubContentView(subViewText: "first text")
                SubContentView(subViewText: "second text")
                SubContentView(subViewText: "third text")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
