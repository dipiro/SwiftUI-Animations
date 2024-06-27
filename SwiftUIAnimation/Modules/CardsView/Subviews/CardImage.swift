//
//  CardImage.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct CardImage: View {
    var cardModel: CardModel
    
    // MARK: - Body
    var body: some View {
        Image(cardModel.imageName)
            .resizable()
            .scaledToFill()
    }
}
