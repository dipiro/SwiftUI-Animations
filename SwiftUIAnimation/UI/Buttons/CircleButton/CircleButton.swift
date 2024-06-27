//
//  CircleButton.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct CircleButton: View {
    var opacity: CGFloat = 1
    var type: CircleButtonType
    var action: (CircleButtonType) -> ()
    
    // MARK: - Body
    var body: some View {
        Button { action(type) } label: {
            Circle()
                .fill(.blue)
                .opacity(opacity)
                .overlay {
                    type.image
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.red)
                        .padding(4)
                }
        }

    }
}
