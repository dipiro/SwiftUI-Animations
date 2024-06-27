//
//  CardDetailView.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct CardDetailView: View {
    @State var textIsVisible: Bool = false
    
    var cardModel: CardModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: .zero) {
            preview
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: Const.blockSpacing) {
                    name
                    if textIsVisible {
                        description
                    }
                    ScrollParallax(items: cardModel.imageNames, label: contentParallax)
                        .frame(height: Const.scrollParallaxHeight)
                }
            }
            .safeAreaPadding(.top, Const.mainScrollTopHeight)
        }
        .navigationBarBackButtonHidden()
        .statusBarHidden()
        .onAppear(perform: appearPerform)
    }
}

// MARK: - Private
private extension CardDetailView {
    var preview: some View {
        CDPreviewImage(image: .init(cardModel.name))
            .frame(width: Const.previewWidth, height: Const.previewHeight)
            .clipShape(RoundedRectangle(cornerRadius: Const.previewCornerRadius))
            .padding()
    }
    
    var name: some View {
        let text = cardModel.name.capitalized
        return CDAnimatedText(text: text, weight: .bold, fontSize: .title)
            .frame(maxWidth: .infinity)
            .textBackground(padding: Const.textNamePadding)
    }
    
    var description: some View {
        CDAnimatedText(text: cardModel.description)
            .textBackground()
    }
    
    func contentParallax(_ item: String) -> some View {
        CDPreviewImage(image: .init(item))
            .frame(height: Const.scrollParallaxHeight)
    }
    
    func appearPerform() {
        withAnimation {
            textIsVisible.toggle()
        }
    }
}

// MARK: - Constant
fileprivate struct Const {
    static let mainScrollTopHeight: CGFloat = 24
    static let blockSpacing: CGFloat = 24
    static let scrollParallaxHeight: CGFloat = 240
    static let textNamePadding: CGFloat = 8
    
    static let previewCornerRadius: CGFloat = 24
    static let previewHeight: CGFloat = 260
    static var previewWidth: CGFloat {
        UIScreen.screenWidth - 32
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var meshGradient = MeshGradientBackground()
    
    return NavigationStack {
        DismissableView {
            CardDetailView(cardModel: Preview.animalia.first!)
                .background { meshGradient }
        }
        .onAppear {
            meshGradient.colors = ClassificationType.animalia.meshGradient
        }
    }
}
