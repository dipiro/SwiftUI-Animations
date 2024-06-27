//
//  OnTapWithAnimation.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import Foundation
import SwiftUI

struct OnTapWithAnimation: ViewModifier {
    var animation: Animation? = .easeInOut(duration: 0.2)
    var isHaptic: Bool = true
    var callback: () -> ()
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                if isHaptic {
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                    impactHeavy.impactOccurred()
                }
                withAnimation(animation) {
                    callback()
                }
            }
    }
}

// MARK: - Extensions
extension View {
    func opTapWithAnimation(_ animation: Animation? = .bouncy, _ isHaptic: Bool = true, _ callback: @escaping () -> ()) -> some View {
        modifier(OnTapWithAnimation(animation: animation, isHaptic: isHaptic, callback: callback))
    }
}
