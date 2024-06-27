//
//  RoundedTextField.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct RoundedTextField: View {
    @Binding var text: String
    
    // MARK: - Body
    var body: some View {
        RoundedRectangle(cornerRadius: .infinity)
            .fill(.blue)
            .overlay {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $text)
                }
                .padding(.horizontal, 8)
            }
    }
}
