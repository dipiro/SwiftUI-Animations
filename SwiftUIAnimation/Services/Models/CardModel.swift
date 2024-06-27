//
//  CardModel.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import Foundation

struct CardModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    
    let name: String
    let imageName: String
    let description: String
    let imageNames: [String]
    
    // MARK: - Init
    init(name: String, 
         description: String = "The body shape of clownfish is perch-like—oval and laterally compressed with an interrupted lateral line.",
         imageNames: [String] = ["whale", "shark", "jellyfish"]) {
        self.name = name
        self.imageName = name
        self.description = description
        self.imageNames = imageNames
    }
}
