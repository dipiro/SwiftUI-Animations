//
//  CardTextOvarlay.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct CardTextOverlay: View {
    var cardModel: CardModel
    var fontSize: CGFloat = 32
    var opacity: Double = 0.6
    
    // MARK: - Body
    var body: some View {
            Text(cardModel.name.uppercased())
                .font(.system(size: fontSize))
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .opacity(opacity)
                .foregroundColor(.white)
    }
}
