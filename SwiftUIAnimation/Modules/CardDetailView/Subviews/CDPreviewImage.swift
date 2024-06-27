//
//  CDPreviewImage.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

struct CDPreviewImage: View {
    var image: Image
    
    // MARK: - Body
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}
