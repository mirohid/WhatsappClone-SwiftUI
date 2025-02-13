//
//  ChatView.swift
//  ChatApp
//
//  Created by MacMini6 on 13/02/25.
//

import SwiftUI

struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var isTabBarHidden: Bool

    var body: some View {
        NavigationStack{
            VStack{
                ScrollView{
                    VStack{
                        ForEach(0..<1){ _ in
                            Section{
                                ForEach(0..<3){ _ in
                                    ChatMessageCell()
                                }
                            } header:{
                                Capsule()
                                    .fill(Color(.systemGray5))
                                    .frame(width: 120, height: 44)
                                    .overlay {
                                        Text("Today")
                                    }
                            }
                        }
                    }
                                    
                }
                Spacer()
                HStack{
                    ZStack{
                        TextField("Type message...", text: $chatViewModel.messageText)
                            .padding(.vertical, 12)
                            .padding(.leading, 44)
                            .padding(.trailing, 70)
                            .background(Color(.white).opacity(0.8))
                            .cornerRadius(30)
                        
                        HStack{
                            Image(systemName: "face.smiling.inverse")
                                .foregroundStyle(.gray)

                            Spacer()
                            Image(systemName: "link")
                            Image(systemName: "camera")
                        }.padding(.horizontal, 12)
                            
                    }
                    Button {
                        //
                    } label: {
                        Image(systemName: chatViewModel.messageText.isEmpty ? "mic.circle.fill" : "paperplane.circle.fill" )
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(Color(.darkGray))
                    }

                    
                }.padding()
                
            }.background{
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(0.3)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    HStack{
                        Button {
                       
                            isTabBarHidden = false
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.backward")
                                .foregroundStyle(Color(.darkGray))
                        }
                        
                        CircularProfileImageView(user: User.MOCK_USER, size: .xSmall)
                        Text(User.MOCK_USER.fullName)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                   
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing:24) {
                        Image(systemName: "video.fill")
                        Image(systemName: "phone.fill")
                        Image(systemName: "ellipsis")
                    }.font(.subheadline)
                        .fontWeight(.semibold)
                   
                }
            }
        }
    }
}

#Preview {
    ChatView(isTabBarHidden: .constant(false))
}
