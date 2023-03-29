//
//  ListRowView.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/27/23.
//

import SwiftUI

struct ListRowView: View{
    
    let item: itemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.square" : "square")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
           Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = itemModel(title: "first item", isCompleted: false)
    static var item2 = itemModel(title: "second item", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
}
