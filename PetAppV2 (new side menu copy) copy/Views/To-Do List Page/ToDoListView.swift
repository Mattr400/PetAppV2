//
//  ToDoListView.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/27/23.
//

import SwiftUI

struct ToDoListView: View {
    
    @State var items: [itemModel] = [
            itemModel(title: "This the first", isCompleted: false),
            itemModel(title: "Second", isCompleted: true),
            itemModel(title: "Third", isCompleted: false),
    ]
    
 
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: deleteItem)
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("To-Do List")
        .navigationBarItems(
            trailing:
                NavigationLink("Add", destination: AddView())
            )
        }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
     
        }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
        }
    }

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ToDoListView()
        }
    }
}


