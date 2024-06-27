//
//  ScrollParallax.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/27/24.
//

import SwiftUI

struct ScrollParallax<Item: Hashable, Label: View>: View {
    var spacing: CGFloat = 16
    var margin: CGFloat = 32
    var cornerRadius: CGFloat = 24
    var items: [Item]
    var label: (Item) -> Label
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: spacing) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        ZStack {
                            label(item)
                                .scrollTransition(axis: .horizontal) { content, phase in
                                    content
                                        .offset(x: phase.isIdentity ? 0 : phase.value * -200)
                                }
                        }
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    }
                }
            }
        }
        .contentMargins(margin)
        .scrollTargetBehavior(.paging)
    }
}
