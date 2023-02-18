//
//  ListItem.swift
//  Fetch-Test-App
//
//  Created by Nicolas Gimelli on 2/18/23.
//

import Foundation

struct ListItem: Codable {
    var id: Int
    var listId: Int
    var name: String?
    
    func toString() -> String {
        return "id: \(id), listId: \(listId), name: \(name ?? "nil")"
    }
}
