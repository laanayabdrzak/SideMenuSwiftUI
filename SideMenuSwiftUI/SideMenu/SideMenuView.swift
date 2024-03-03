//
//  SideMenuView.swift
//  SideMenuSwiftUI
//
//  Created by LAANAYA Abderrazak on 3/3/2024.
//

import SwiftUI

struct SideMenuConstants {
    static let menuWidth: CGFloat = 270
}

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedTab: Int
    @State private var selectedOption: SideMenuOptionModel? = .home
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        
                        /*VStack {
                         ForEach(SideMenuOptionModel.allCases) { option in
                         Button(action: {
                         onOptionTapped(option)
                         }, label: {
                         SideMenuRowView(option: option, selectedOption: $selectedOption)
                         })
                         }
                         }*/
                        VStack(alignment: .leading, spacing: 16) {
                            SideMenuSectionView(sectionTitle: .main, options: [.home, .favorite], selectedOption: $selectedOption)
                            SideMenuSectionView(sectionTitle: .account, options: [.chat, .profile], selectedOption: $selectedOption)
                            
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: SideMenuConstants.menuWidth, alignment: .leading)
                    .background(colorScheme == .dark ? .black : .white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isShowing)
        .onChange(of: selectedOption) {
            if let selectedOption = selectedOption {
                isShowing = false
                selectedTab = selectedOption.rawValue
            }
        }
        .onAppear() {
            selectedOption = .home
        }
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true), selectedTab: .constant(0))
}
