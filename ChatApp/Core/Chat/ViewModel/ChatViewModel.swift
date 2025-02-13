//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by MacMini6 on 13/02/25.
//

import Foundation
import SwiftUI

class ChatViewModel:ObservableObject {
    @Published var messageText:String = ""
    @Published var tabbarVisibility: Visibility = .hidden
}
