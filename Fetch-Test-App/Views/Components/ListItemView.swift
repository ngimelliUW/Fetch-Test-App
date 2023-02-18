//
//  ListItemView.swift
//  Fetch-Test-App
//
//  Created by Nicolas Gimelli on 2/18/23.
//

import SwiftUI

// A struct for this subview allows further development of the view to be much easier and more organized.
struct ListItemView: View {
    var item: ListItem
    
    private let listItemWidth: CGFloat = 300
    private let listItemHeight: CGFloat = 70
    
    var body: some View {
        ZStack {
            Rectangle().cornerRadius(12).foregroundColor(Color("primaryContentBackground"))
            
            HStack {
                Text(item.name ?? "")
                    .font(.headline)
                Spacer()
                Text("listId: \(item.listId)")
                    .font(.caption)
            }
            .padding(.horizontal)
        }
        .frame(width: listItemWidth, height: listItemHeight)
    }
}
