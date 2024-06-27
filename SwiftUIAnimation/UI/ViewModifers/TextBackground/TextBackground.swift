//
//  TextBackground.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/27/24.
//

import SwiftUI

struct TextBackgroundViewModifier: ViewModifier {
    var padding: CGFloat
    var cornerRadius: CGFloat
    var opacity: Double
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.light)
            .padding(padding)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.black.opacity(opacity))
            }
            .padding(.horizontal)
    }
}

// MARK: - View
extension View {
    func textBackground(padding: CGFloat = 16, cornerRadius: CGFloat = 24, opacity: Double = 0.3) -> some View {
        self.modifier(TextBackgroundViewModifier(padding: padding, cornerRadius: cornerRadius, opacity: opacity))
    }
}
