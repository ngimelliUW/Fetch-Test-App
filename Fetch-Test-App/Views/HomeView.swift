//
//  ContentView.swift
//  Fetch-Test-App
//
//  Created by Nicolas Gimelli on 2/18/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var listModel: ListModel = ListModel()
    @State var selectedFilter: Int = 0 // 0 correponds to "view all", 1 corresponds to list 1, etc.

    var body: some View {
        VStack {
            navBar
            filterBar
            
            List {
                ForEach(listModel.getListItemsById(id: selectedFilter)) { item in
                    ListItemView(item: item)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .padding(.leading)
        }
    }

    // App title, plus space for navbar buttons if we wish to add them in the future
    private var navBar: some View {
        HStack {
            Text("Fetch Items App")
                .font(.largeTitle)
                .bold()

            Spacer()
        }
        .padding()
    }

    // a bar of capsules; one capsule per listId that allows the user to filter which listId group is showing
    // also has a View All capsule
    private var filterBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ZStack {
                    Capsule()
                        .frame(width: 80, height: 30)
                        .foregroundColor(selectedFilter == 0 ? .primary : Color("primaryContentBackground"))
                    Text("View All")
                        .bold()
                        .foregroundColor(selectedFilter == 0 ? Color("whiteBlack") : .primary)
                }
                .onTapGesture { selectedFilter = 0 } // 0 corresponds to "view all"

                // iterate through each possible listId and provide a filter capsule for it
                ForEach(listModel.listIds, id: \.self) { id in
                    ZStack {
                        Capsule()
                            .frame(width: 60, height: 30)
                            .foregroundColor(selectedFilter == id ? .primary : Color("primaryContentBackground"))
                        Text("List \(id)")
                            .foregroundColor(selectedFilter == id ? Color("whiteBlack") : .primary)
                    }
                    .onTapGesture { selectedFilter = id }
                }

                Spacer()
            }
            .padding(.horizontal, 30)
        }
        .padding(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
