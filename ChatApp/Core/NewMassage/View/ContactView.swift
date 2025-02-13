//
//  ContactView.swift
//  ChatApp
//
//  Created by MacMini6 on 13/02/25.
//

import SwiftUI
struct ContactView: View {
     var image: String
     var title: String
    var body: some View {
        HStack(spacing:16){
            Image(systemName: image)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.gray)
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Spacer()
        }
    }
}
