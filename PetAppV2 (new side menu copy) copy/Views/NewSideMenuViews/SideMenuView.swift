//
//  SideMenuView.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/28/23.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                // Header
                SideMenuHeaderView(isShowing: $isShowing)
                    .frame(height: 170)
                // Option Cells
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                    navigationLink(for: viewModel)
                }
                Spacer()
               
            }
        }.navigationBarHidden(true)
    }
}

func navigationLink(for viewModel: SideMenuViewModel) -> some View {
    switch viewModel {
    case .profile:
        return AnyView(NavigationLink(destination: ProfileView()
            .navigationBarTitle("Profile")
                              , label: {
            SideMenuOptionsView(viewModel: viewModel)
        }))
    case .petBot:
        return AnyView(NavigationLink(destination: PetBotView()
            .navigationTitle("PetBot"), label: {
                SideMenuOptionsView(viewModel: viewModel)
            }))
    case .yourPet:
        return AnyView(NavigationLink(destination: YourPetsView(), label: {
            SideMenuOptionsView(viewModel: viewModel)
        }))
    case .toDoList:
        return AnyView(NavigationLink(destination: ToDoListView(), label: {
            SideMenuOptionsView(viewModel: viewModel)
        }))
    case .settings:
        return AnyView(NavigationLink(destination: SettingsView(), label: {
            SideMenuOptionsView(viewModel: viewModel)
        }))
    case .logout:
        return AnyView(NavigationLink(destination: SignInOutView(), label: {
            SideMenuOptionsView(viewModel: viewModel)
        }))
    }
}



struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
