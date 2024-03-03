//
//  SideMenuSectionModel.swift
//  SideMenuSwiftUI
//
//  Created by LAANAYA Abderrazak on 3/3/2024.
//

import Foundation

enum SideMenuSectionModel: String, CaseIterable {
    case main
    case account
    
    var title: String{
        switch self {
        case .main:
            return "Main"
        case .account:
            return "Account"
        }
    }
}
