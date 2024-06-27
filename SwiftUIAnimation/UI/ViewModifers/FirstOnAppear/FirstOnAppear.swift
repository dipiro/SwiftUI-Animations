//
//  FirstOnAppear.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/27/24.
//

import SwiftUI

struct FirstOnAppear: ViewModifier {
    @State private var isLoaded = false
    private let action: (() -> ())?
    // MARK: - Init
    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }
    
    // MARK: - Body
    func body(content: Content) -> some View {
        content
            .onAppear() {
                if !isLoaded {
                    isLoaded = true
                    action?()
                }
            }
    }
}

// MARK: - Extension
extension View {
    func firstOnAppear(perform action: (() -> Void)? = nil) -> some View {
        modifier(FirstOnAppear(perform: action))
    }
}
