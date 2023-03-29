//
//  SideMenuViewModel.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/28/23.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case petBot
    case yourPet
    case toDoList
    case settings 
    case logout
    
    var title: String{
        switch self {
        case .profile: return "Profile"
        case .petBot: return "Petbot"
        case .yourPet: return "Your Pets"
        case .toDoList: return "ToDoList"
        case .settings: return "Settings"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .petBot: return "ellipsis.message"
        case .yourPet: return "pawprint"
        case .toDoList: return "checklist"
        case .settings: return "gearshape.2"
        case .logout: return "door.right.hand.open"
        }
    }
}








