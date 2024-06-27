//
//  DismissableView.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct DismissableView<Content: View>: View {
    @Environment(\.dismiss) private var dismiss
    @ViewBuilder var content: () -> Content
    @State var opacity: CGFloat = 0.3
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topLeading) {
            content()
            dismissButton
        }
        .navigationBarBackButtonHidden()
        .statusBarHidden()
    }
}

// MARK: - Private
extension DismissableView {
    var dismissButton: some View {
        HStack {
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .frame(width: Const.imageWidth, height: Const.imageWidth)
                    .foregroundColor(Color(uiColor: .label))
                    .background(.black.opacity(opacity))
                
                    .clipShape(Circle())
            }
            .padding([.top, .trailing], Const.buttonTopTrailingPadding)
        }
    }
}

// MARK: - Constant
fileprivate struct Const {
    static let imageWidth: CGFloat = 30
    static let buttonTopTrailingPadding: CGFloat = 30
}
