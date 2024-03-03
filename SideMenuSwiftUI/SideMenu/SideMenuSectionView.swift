//
//  SideMenuSectionView.swift
//  SideMenuSwiftUI
//
//  Created by LAANAYA Abderrazak on 3/3/2024.
//

import SwiftUI

struct SideMenuSectionView: View {
    let sectionTitle: SideMenuSectionModel
    let options: [SideMenuOptionModel]
    @Binding var selectedOption: SideMenuOptionModel?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(sectionTitle.title)
                .font(.headline)
                .foregroundStyle(.gray)
                .opacity(0.6)
                .padding(.leading)
            
            ForEach(options) { option in
                Button(action: {
                    onOptionTapped(option)
                }, label: {
                    SideMenuRowView(option: option, selectedOption: $selectedOption)
                        .padding(.leading)
                })
            }
        }
    }
    
    
}

extension SideMenuSectionView {
    private func onOptionTapped(_ option: SideMenuOptionModel) {
        selectedOption = option
    }
}

#Preview {
    SideMenuSectionView(sectionTitle: .main,
                        options: [.home, .chat],
                        selectedOption: .constant(.home))
}
