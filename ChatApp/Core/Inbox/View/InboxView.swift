//
//  InboxView.swift
//  ChatApp
//
//  Created by MacMini6 on 12/02/25.
//

import SwiftUI

struct InboxView: View {
    @StateObject private var viewModel = InboxViewModel()
    @Binding var isTabBarHidden: Bool
    var body: some View {
        NavigationStack{
            GeometryReader { proxy in
                ZStack(alignment: .bottomTrailing){
                    List{
                        
                        ForEach(0..<10){ _ in
                            NavigationLink {
                                ChatView(isTabBarHidden: $isTabBarHidden)
                                    .onAppear{ isTabBarHidden = true}
                                    .onDisappear{isTabBarHidden = false}
                                    .navigationBarBackButtonHidden(true)
                                    .toolbar(.hidden, for: .tabBar) // Hide the tab bar
                            } label: {
                                InboxRowView(width: proxy.size.width)
                            }
                        }
                    }.listStyle(PlainListStyle())
                    
                    Button {
                        viewModel.ShowNewmessage.toggle()
                    } label: {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.green))
                            .frame(width: 50, height: 50)
                            .padding()
                            .overlay {
                                Image(systemName: "plus.bubble.fill")
                                    .tint(.white)
                            }.padding()
                    }.fullScreenCover(isPresented: $viewModel.ShowNewmessage) {
                        NewMessageView()
                    }
                    
                }.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("WhatsApp")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing:24){
                            Image(systemName: "camera")
                            Image(systemName: "magnifyingglass")
                            Image(systemName: "ellipsis")
                        }.fontWeight(.semibold)
                    }
                }
                .toolbarBackground(Color.gray, for: .navigationBar) // Sets the background color
                .toolbarColorScheme(.dark, for: .navigationBar)
            }
            
        }
    }
}

#Preview {
    InboxView(isTabBarHidden: .constant(false))
}
