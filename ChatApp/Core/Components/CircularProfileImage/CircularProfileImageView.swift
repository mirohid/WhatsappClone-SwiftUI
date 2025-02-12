//
//  CircularProfileImageView.swift
//  ChatApp
//
//  Created by MacMini6 on 12/02/25.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    case xxLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xLarge:
            return 80
        case .xxLarge:
            return 120
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
    init(user: User? = nil, size: ProfileImageSize) {
        self.user = user
        self.size = size
    }

    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .scaledToFill()
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView( size: .medium)
}
