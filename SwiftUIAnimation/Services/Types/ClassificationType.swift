//
//  ClassificationType.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import SwiftUI

enum ClassificationType: String, Identifiable, CaseIterable, Hashable {
    case  bacteria, animalia, plantae, fungi, archaea, protista
    
    var id: Self { self }
    
    var items: [CardModel] {
        switch self {
        case .plantae:
            return Preview.plantae
        default:
            return Preview.animalia
        }
    }
    
    var meshGradient: [Color] {
        switch self {
        case .plantae: return [
            Color("lightGreenColor"), Color("lightGreenColor"), Color("lightGreenColor"),
            Color("middleGreenColor"), Color("middleGreenColor"), Color("middleGreenColor"),
            Color("darkGreenColor"), Color("darkGreenColor"), Color("darkGreenColor")
        ]
        default: return [
            Color("lightBlueColor"), Color("lightBlueColor"), Color("lightBlueColor"),
            Color("middleBlueColor"), Color("middleBlueColor"), Color("middleBlueColor"),
            Color("darkBlueColor"), Color("darkBlueColor"), Color("darkBlueColor")
        ]
        }
    }
}
