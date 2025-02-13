//
//  NewMessageView.swift
//  ChatApp
//
//  Created by MacMini6 on 13/02/25.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack (alignment: .leading, spacing: 24){
                    ContactView(image: "person.2.circle.fill", title: "New Group")
                    ContactView(image: "person.circle.fill", title: "New Contact")
                    ContactView(image: "sharedwithyou.circle.fill", title: "New Community")
                    
                }.padding(.top)
          
                
                Text("Contacts on your phone")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.darkGray))
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<10){ _ in
                        HStack(spacing:10){
                            CircularProfileImageView(user: User.MOCK_USER, size: .small)
                            VStack(alignment:.leading){
                                Text(User.MOCK_USER.fullName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("hey there! I am Using WhatsApp")
                                    .font(.caption)
                                    .fontWeight(.regular)
                            }
                            Spacer()
                        }.padding(.bottom,20)
                }
            }.padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing:36){
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.gray)
                        }
                        
                        VStack(alignment: .leading){
                            Text("Select Contact")
                                .font(.subheadline)
                                
                            Text("2 Contacts")
                                .font(.caption)
                        } .foregroundStyle(Color(.darkGray))
                            .bold()

                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing:20){
                        Image(systemName: "magnifyingglass")
                        Image(systemName: "ellipsis")
                        
                    }
                }
            }
        }
    }
}

#Preview {
    NewMessageView()
}

