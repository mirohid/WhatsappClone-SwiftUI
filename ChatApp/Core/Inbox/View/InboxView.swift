//
//  InboxView.swift
//  ChatApp
//
//  Created by MacMini6 on 12/02/25.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack{
            GeometryReader { proxy in
                ZStack(alignment: .bottomTrailing){
                    List{
                        
                        ForEach(0..<10){ _ in
                            InboxRowView(width: proxy.size.width)
                        }
                    }.listStyle(PlainListStyle())
                    
                    Button {
                        //
                    } label: {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.darkGray))
                            .frame(width: 50, height: 50)
                            .padding()
                            .overlay {
                                Image(systemName: "plus.bubble.fill")
                                    .tint(.white)
                            }
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
    InboxView()
}
