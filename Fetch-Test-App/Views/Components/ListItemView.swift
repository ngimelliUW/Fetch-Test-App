//
//  ListItemView.swift
//  Fetch-Test-App
//
//  Created by Nicolas Gimelli on 2/18/23.
//

import SwiftUI

struct ListItemView: View {
    var item: ListItem
    
    private let listItemWidth: CGFloat = 300
    private let listItemHeight: CGFloat = 70
    
    var body: some View {
        ZStack {
            Rectangle().cornerRadius(12).foregroundColor(.gray.opacity(0.1))
            
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