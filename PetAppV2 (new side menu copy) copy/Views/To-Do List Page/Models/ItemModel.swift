//
//  ItemModel.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/27/23.
//

import Foundation

struct itemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
