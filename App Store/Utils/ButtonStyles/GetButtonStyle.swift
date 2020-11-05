//
//  GetButtonStyle.swift
//  App Store
//
//  Created by Erim Kurt on 31/10/2563 BE.
//

import Foundation
import SwiftUI

enum GetButtonStyleType {
    case gray
    case blue
}

struct GetButtonStyle: ButtonStyle {
    
    var titleColor: Color = .blue
    var background: Color = .gray
    
    init (type: GetButtonStyleType) {
        switch type {
        case .gray:
            self.titleColor = .blue
            self.background = Color.gray.opacity(0.2)
        case .blue:
            self.titleColor = .white
            self.background = .blue
        }
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 20.0)
            .padding(.vertical, 5.0)
            .font(Font.body.bold())
            .foregroundColor(configuration.isPressed ? titleColor.opacity(0.5) : titleColor)
            .background(configuration.isPressed ? background.opacity(0.7) : background)
            .clipShape(
                RoundedRectangle(cornerRadius: 15)
            )
    }
}
