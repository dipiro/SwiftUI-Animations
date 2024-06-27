//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/24/24.
//

import SwiftUI

struct CardsView: View {
    @Namespace var animation
    @State var items: [CardModel] = Preview.animalia
    @State var selectedItem: ClassificationType = .animalia
    @State var meshGradient = MeshGradientBackground()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: Const.blockPadding) {
                    HStack(spacing: Const.menuSpacing) {
                        segmentedControl
                        Spacer()
                        contextMenu
                    }
                    .frame(height: Const.menuHeight)
                    
                    ForEach(items) { item in
                        NavigationLink(value: item) {
                            cell(for: item)
                        }
                    }
                }
                .padding(.horizontal)
                .navigationDestination(for: CardModel.self, destination: destination)
            }
            .background { meshGradient }
            .firstOnAppear { meshGradient.colors = selectedItem.meshGradient }
            .onChange(of: selectedItem, changingBySelectedItem)
        }
    }
}

// MARK: - Private
private extension CardsView {
    var contextMenu: some View {
        CircleView(type: .menu)
            .contextMenu { }
    }
    
    var segmentedControl: some View {
        RoundedSegmentedControl(
            selectedItem: $selectedItem,
            items: ClassificationType.allCases,
            selectedColor: .black) { item in
                HStack {
                    Image(item.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                    Text(item.rawValue.capitalized).font(.callout)
                }
                .frame(height: Const.segmentedControlHeight)
            }
    }
    
    func destination(_ model: CardModel) -> some View {
        DismissableView {
            CardDetailView(cardModel: model)
                .navigationTransition(.zoom(sourceID: model.id, in: animation))
                .background { meshGradient }
        }
    }
    
    func cell(for model: CardModel) -> some View {
        CardCell(cardModel: model)
            .matchedTransitionSource(id: model.id, in: animation) { source in
                source
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 8)
            }
            .clipShape(RoundedRectangle(cornerRadius: Const.cellCornerRadius))
            .shadow(radius: Const.cellShadow)
            .visualEffect { content, proxy in
                let frame = proxy.frame(in: .scrollView(axis: .vertical))
                let distance = min(.zero, frame.minY)
                
                return content
                    .scaleEffect(1 + distance / 900)
                    .offset(y: -distance / 1)
                    .blur(radius: -distance / 50)
            }
    }
    
    func changingBySelectedItem() {
        withAnimation {
            items = selectedItem.items
            meshGradient.colors = selectedItem.meshGradient
        }
    }
}

// MARK: - Constant
fileprivate struct Const {
    static let menuSpacing: CGFloat = 8
    static let menuHeight: CGFloat = 32
    
    static let blockPadding: CGFloat = 24
    
    static let segmentedControlHeight: CGFloat = 18
    
    static let cellShadow: CGFloat = 8
    static let cellCornerRadius: CGFloat = 24
}

// MARK: - Preview
#Preview {
    CardsView()
}
