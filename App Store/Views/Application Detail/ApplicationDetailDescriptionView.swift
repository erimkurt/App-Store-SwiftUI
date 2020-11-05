//
//  ApplicationDetailDescriptionView.swift
//  App Store
//
//  Created by Erim Kurt on 5/11/2563 BE.
//

import Foundation

import SwiftUI

struct ApplicationDetailDescriptionView: View {
    
    var application: Application?
    
    @State var isExpanded: Bool = false
    
    var body: some View {
        ZStack {
            Text(application?.description ?? "")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(isExpanded ? nil : 3)
                .lineLimit(nil)
                .padding(.vertical)
            if !isExpanded {
                VStack(alignment: .trailing) {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Spacer()
                        Button("more", action: {
                            withAnimation(.easeOut(duration: 1)) {
                                isExpanded.toggle()
                            }
                        })
                        .background(Color(UIColor.systemBackground))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding(.vertical)
                .shadow(color: Color(UIColor.systemBackground), radius: 5, x: -20, y: 0)
            }
        }
        .transition(AnyTransition.scale)
        .animation(.default)
    }
}
