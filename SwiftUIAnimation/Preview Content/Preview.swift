//
//  Preview.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import Foundation

struct Preview {
    static let animalia: [CardModel] = [
        .init(name: "dolphin"),
        .init(name: "whale"),
        .init(name: "shark"),
        .init(name: "crab"),
        .init(name: "turtle"),
        .init(name: "octopus"),
        .init(name: "stingray"),
        .init(name: "jellyfish",
              description: "Jellyfish have been around for over 500 million years, making them older than dinosaurs. They are found in every ocean and can range in size from less than an inch to over six feet across.",
              imageNames: ["jellyfish_1", "jellyfish_2", "jellyfish_3", "jellyfish_4"]),
    ]
    
    static let plantae: [CardModel] = [
        .init(name: "pine"),
        .init(name: "rosa"),
        .init(name: "coconut"),
        .init(name: "bamboo"),
    ]
}
