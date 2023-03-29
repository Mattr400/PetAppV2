//
//  ProfileView.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/28/23.
//
import SwiftUI

struct ProfileView: View {

  //MARK: @STATE
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var birthDate = Date()
    @State private var petBreed = ""
    @State private var petType = ""
    



  //MARK: BODY OF CODE
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(75)
                        .overlay(RoundedRectangle(cornerRadius: 75)
                            .stroke(Color(.label),lineWidth: 1)
                        )
                        .shadow(radius:20)

                    VStack(alignment: .center, spacing: 10) {}
                }
                .navigationBarHidden(true)
Form {
                    Section(header: Text("Personal Information")){
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        TextField("Email", text: $email)
                        DatePicker("BirthDate", selection: $birthDate, displayedComponents: .date)
                    }
                    Section(header: Text("Favorite Pet")) {
                        TextField("Pet Type",
                                  text: $petType)
                        TextField("Pet Breed",
                                  text: $petBreed)
                }

                }
                Spacer()
                    
            }
        }
    }
}
//MARK: PROFILE-VIEW
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ProfileView()
        }
    }
}
