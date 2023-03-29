//
//  AddView.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/27/23.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
//    @State var sideMenuButton: MainView
    
    var body: some View {
    ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                
            }
        }
        .navigationTitle("Add Task/Reminder")
    }
    

}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
