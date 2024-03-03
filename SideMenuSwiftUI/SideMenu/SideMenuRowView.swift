//
//  SideMenuRowView.swift
//  SideMenuSwiftUI
//
//  Created by LAANAYA Abderrazak on 3/3/2024.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?

    private var isSelected: Bool {
        return selectedOption == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.small)
            
            Text(option.title)
                .font(.subheadline)
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue : .primary)
        .frame(height: 44)
        .background(isSelected ? .blue.opacity(0.2) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}

#Preview {
    SideMenuRowView(option: .home, selectedOption: .constant(.home))
}
