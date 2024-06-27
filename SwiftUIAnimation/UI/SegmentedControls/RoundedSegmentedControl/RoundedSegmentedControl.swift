//
//  RoundedSegmentedControl.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct RoundedSegmentedControl<Item: Hashable, Content: View>: View {
    @Binding var selectedItem: Item
    
    var items: [Item]
    var selectedColor: Color = .red
    var content: (Item) -> Content
    
    // MARK: - Body
    var body: some View {
        ScrollViewReader { proxy in
            scrollView {
                lazyHGrid {
                    ForEach(items, id: \.self) { item in
                        content(item)
                            .id(item)
                            .padding(.horizontal, Const.itemInnerHPadding)
                            .padding(.vertical, Const.itemInnerVPadding)
                            .background() {
                                Capsule()
                                    .foregroundStyle(selectedItem == item ? selectedColor : selectedColor.opacity(0.3))
                            }
                            .opTapWithAnimation { selectedItem = item }
                            .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1.0 : 0.8)
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.4)
                                    .blur(radius: phase.isIdentity ? 0 : 6)
                            }
                    }
                    .onChange(of: selectedItem) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            proxy.scrollTo(selectedItem, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Private
private extension RoundedSegmentedControl {
    func lazyHGrid(_ content: @escaping () -> some View) -> some View {
        LazyHGrid(rows: [GridItem(.flexible())], spacing: Const.itemSpacing) {
            content()
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    func scrollView(_ content: @escaping () -> some View) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            content()
        }
    }
}

// MARK: - Const
fileprivate struct Const {
    static let itemSpacing: CGFloat = 12
    static let itemInnerHPadding: CGFloat = 10
    static let itemInnerVPadding: CGFloat = 8
}
