//
//  MeshGradient.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct MeshGradientBackground: View {
    var points: [SIMD2<Float>] = [
        [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
        [0.0, 0.3], [0.5, 0.6], [1.0, 0.7],
        [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
    ]
    
    var colors: [Color] = []
    
    // MARK: - Body
    var body: some View {
        MeshGradient(width: 3, height: 3, points: points, colors: colors)
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Preview
#Preview {
    MeshGradientBackground()
}
