//
//  ListViewModel.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/28/23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [itemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            itemModel(title: "This the first", isCompleted: false),
            itemModel(title: "Second", isCompleted: true),
            itemModel(title: "Third", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
        }
    
    
}
