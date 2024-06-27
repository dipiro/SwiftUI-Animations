//
//  CircleButtonType.swift
//  SwiftUIAnimation
//
//  Created by piro2 on 6/25/24.
//

import Foundation
import SwiftUI

enum CircleButtonType {
    case filter, list, twoColumn, magnifyingGlass, menu
    
    var image: Image {
        switch self {
        case .filter:
            return Image("filter")
        case .list:
            return Image("columnOne")
        case .twoColumn:
            return Image("columnTwo")
        case .magnifyingGlass:
            return Image(systemName: "magnifyingglass")
        case .menu:
            return Image("menu")
        }
    }
}
