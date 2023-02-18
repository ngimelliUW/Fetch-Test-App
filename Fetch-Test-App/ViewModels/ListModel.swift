//
//  ListModel.swift
//  Fetch-Test-App
//
//  Created by Nicolas Gimelli on 2/18/23.
//

import Foundation

class ListModel: ObservableObject {
    let urlStr: String = "https://fetch-hiring.s3.amazonaws.com/hiring.json"
    
    init() {
        if let url = URL(string: urlStr) {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                 if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString)
                 }
               }
           }.resume()
        }
    }
}
