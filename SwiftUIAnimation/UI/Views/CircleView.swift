//
//  CircleView.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/27/24.
//

import SwiftUI

struct CircleView: View {
    var type: CircleButtonType
    var opacity: Double = 0.3
    var padding: CGFloat = 8
    
    // MARK: - Body
    var body: some View {
        Circle()
            .fill(.black)
            .opacity(opacity)
            .overlay {
                type.image
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .padding(padding)
            }
    }
}
