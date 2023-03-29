//
//  ContentView.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing{
                    SideMenuView(isShowing: $isShowing)
                }
                HomeView()
                    .cornerRadius(isShowing ? 20 : 10)
                    .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                    .scaleEffect(isShowing ? 0.95 : 1)
                    .navigationBarItems(leading:  Button(action: {
                        withAnimation(.spring()){
                            isShowing.toggle()
                        }
                    }, label: {
                        VStack(spacing: 5) {
                            
                            Capsule()
                                .fill(isShowing ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                            //Rotating 'X'
                                .rotationEffect(.init(degrees: isShowing ? -50 : 0))
                                .offset(x: isShowing ? 2 : 0, y: isShowing ? 9 : 0)
                            
                            VStack(spacing: 5) {
                                
                                Capsule()
                                    .fill(isShowing ? Color.white : Color.primary)
                                    .frame(width: 30, height: 3)
                                
                                //Moving up when clicked...
                                Capsule()
                                    .fill(isShowing ? Color.white : Color.primary)
                                    .frame(width: 30, height: 3)
                                    .offset(y: isShowing ? -8 : 0)
                            }
                            //Rotating 'X'
                            .rotationEffect(.init(degrees: isShowing ? 50 : 0))
                        }
                        
                        
                    }))
                }
            .onAppear {
                isShowing = false
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct HomeView: View {

    
    var body: some View {
        ZStack {
            Color(.white)
            
            Text("Hello")
                .padding()
        }
       
        .navigationTitle("Home")
    }
}
