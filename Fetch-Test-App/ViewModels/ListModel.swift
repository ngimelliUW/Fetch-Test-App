//
//  ListModel.swift
//  Fetch-Test-App
//
//  Created by Nicolas Gimelli on 2/18/23.
//

import Foundation

class ListModel: ObservableObject {
    let urlStr: String = "https://fetch-hiring.s3.amazonaws.com/hiring.json"
    @Published var listItems: [ListItem] = [ListItem]()

    init() {
        fetchListItems()
    }

    private func fetchListItems() {
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    DispatchQueue.main.async {
                        do {
                            self.listItems = try JSONDecoder().decode([ListItem].self, from: data)
                        } catch let error {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
}
