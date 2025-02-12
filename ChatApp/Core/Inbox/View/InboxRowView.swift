//
//  InboxRowView.swift
//  ChatApp
//
//  Created by MacMini6 on 12/02/25.
//

import SwiftUI

struct InboxRowView: View {
    private var width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        HStack(spacing:24){
            CircularProfileImageView(size: .medium)
               VStack(alignment: .leading, spacing: 8){
                Text("Steve Jobs")
                    .font(.headline)
                Text("Hello, world!")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .frame(maxWidth: width - 100, alignment: .leading)
            }
            HStack{
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }.font(.footnote)
                .foregroundStyle(Color(.systemGray))
            
        }.frame(height: 70)
    }
}

#Preview {
    InboxRowView(width: 300)
}
