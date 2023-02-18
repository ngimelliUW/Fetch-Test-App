//
//  ContentView.swift
//  Fetch-Test-App
//
//  Created by Nicolas Gimelli on 2/18/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var listModel: ListModel = ListModel()
    
    var body: some View {
        VStack {
            Text("count: \(listModel.listItems.count)")
            List {
                ForEach(listModel.listItems) { listItem in
                    Text(listItem.toString())
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
