//
//  SideMenuHeaderView.swift
//  PetAppV2
//
//  Created by Matthew Regalado on 3/28/23.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button(action: {
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
                .padding()
            })
            
            VStack(alignment: .leading) {
                
                //Profile Image
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                    .padding(.bottom, 8)
                
                Text("Welcome Matthew")
                    .font(.system(size:24, weight: .semibold))
                    .padding(.bottom, 8)
                
                //HStack pushes everything to the left
                HStack {
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowing: .constant(true))
    }
}
