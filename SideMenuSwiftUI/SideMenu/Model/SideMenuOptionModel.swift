//
//  SideMenuOptionModel.swift
//  SideMenuSwiftUI
//
//  Created by LAANAYA Abderrazak on 3/3/2024.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case home = 0
    case favorite
    case chat
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .chat:
            return "Chat"
        case .profile:
            return "Profile"
        }
    }
    
    var systemImageName: String{
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "star"
        case .chat:
            return "message"
        case .profile:
            return "person.crop.circle"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int { return self.rawValue }
}
