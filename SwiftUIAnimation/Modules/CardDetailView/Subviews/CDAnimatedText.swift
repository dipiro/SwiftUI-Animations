//
//  CDDescription.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/27/24.
//

import SwiftUI

struct CDAnimatedText: View {
    var text: String
    var weight: Font.Weight = .regular
    var fontSize: Font = .body
    
    // MARK: - Body
    var body: some View {
        Text(text)
            .font(fontSize)
            .customAttribute(EmphasisAttribute())
            .fontDesign(.rounded)
            .fontWeight(weight)
            .transition(TextTransition())
    }
}
