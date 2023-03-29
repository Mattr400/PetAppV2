//
//  SettingsView.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/28/23.
//
import SwiftUI
struct SettingsView: View {
    @State private var shouldSendReminders = false
    @State private var numberOfLikes = 1
    @State private var darkOrLight = false
    @State private var colorBlind = false
    
    var body: some View {
            Form {
               
                Section(header: Text("Reminder Settings")) {
                    Toggle("Send To Do List Reminders", isOn: $shouldSendReminders)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of Reminders", value: $numberOfLikes, in: 1...10)
                    Text("Total Reminders on home page \(numberOfLikes)")
                }
                Section(header: Text("Visual View")) {
                    Toggle("Light Or Dark Mode", isOn: $darkOrLight)
                        .toggleStyle(SwitchToggleStyle(tint: .black))
                    Toggle("Color Blind Option", isOn: $colorBlind)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                    Stepper("Color Blind Change", value: $numberOfLikes, in: 1...10)
                    
                }
                Section(header: Text("")) {
                    Link("Terms Of Service", destination: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ%22")!)
                }
            }
            .accentColor(.red)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                    }
                    Button("Save", action: saveUser)
                }
            }
    }
    
    func saveUser() {
        print("User Saved")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsView()
        }
    }
}
