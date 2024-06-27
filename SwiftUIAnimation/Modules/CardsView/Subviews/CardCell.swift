//
//  CardCell.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct CardCell: View {
    var cardModel: CardModel
    var height: CGFloat = 160
    
    //MARK: - Body
    var body: some View {
        ZStack(alignment: .topLeading) {
            CardImage(cardModel: cardModel)
                .frame(height: height)
            CardTextOverlay(cardModel: cardModel)
                .padding([.leading], Const.textLeadingPadding)
                .padding([.top], Const.textTopPadding)
        }
    }
}

// MARK: - Constant
fileprivate struct Const {
    static let textLeadingPadding: CGFloat = 16
    static let textTopPadding: CGFloat = 8
}
