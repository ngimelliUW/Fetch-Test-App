//
//  ListModel.swift
//  Fetch-Test-App
//
//  Created by Nicolas Gimelli on 2/18/23.
//

import Foundation

class ListModel: ObservableObject {
    @Published var listItems: [ListItem] = [ListItem]()
    var listIds: [Int] = []
    
    let urlStr: String = "https://fetch-hiring.s3.amazonaws.com/hiring.json"

    init() {
        fetchListItems()
    }
    
    /**
     Returns a subsequence of listItems based on the given id.
     
     Parameter id: The items in itemList to retrieve as a list.
     */
    func getListItemsById(id: Int) -> [ListItem] {
        if id == 0 {
            return listItems
        }
        
        return listItems.filter({$0.listId == id})
    }
    
    /**
     Makes an API request to url, then calls the initializing methods for sorting and filtration
     */
    private func fetchListItems() {
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    DispatchQueue.main.async {
                        do {
                            self.listItems = try JSONDecoder().decode([ListItem].self, from: data)
                            self.filterEmptyNames()
                            self.sortListItems()
                            self.initListIds()
                        } catch let error {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
    
    /**
     Removes items from listItems with nil or empty names
     */
    private func filterEmptyNames() {
        self.listItems = listItems.filter({$0.name != nil && !$0.name!.isEmpty})
    }
        
    /**
     Sorts list items first based on their listId then based on their name.
     Because item names directly correspond to their id, this is a more efficient way of sorting.
     */
    private func sortListItems() {
        self.listItems = listItems.sorted(by: {
            if $0.listId != $1.listId {
                return $0.listId < $1.listId
            } else {
                return $0.id < $1.id // name always corresponds to "Item \(id)", thus this line sorts by name
            }
        })
    }
    
    /**
     Initializes the listIds field, which generate one filter per id in HomeView()
     */
    private func initListIds() {
        for item in self.listItems {
            if !self.listIds.contains(item.listId) {
                self.listIds.append(item.listId)
            }
        }
    }
}
