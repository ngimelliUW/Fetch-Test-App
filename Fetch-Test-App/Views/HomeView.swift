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
            navBar
            List {
                ForEach(listModel.listItems) { listItem in
                    Text(listItem.toString())
                }
            }
        }
        .padding()
    }
    
    private var navBar: some View {
        HStack {
            Text("Fetch Items App")
                .font(.largeTitle)
                .bold()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
