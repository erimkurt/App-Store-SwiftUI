//
//  ApplicationDetailPreview.swift
//  App Store
//
//  Created by Erim Kurt on 8/11/2563 BE.
//

import Foundation
import SwiftUI

struct ApplicationDetailPreview: View {
    
    var urls: [String] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            Text("Preview")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .padding(.horizontal, 15.0)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0.0) {
                    ForEach(urls, id: \.self) { url in
                        ImageView(withURL: url, cornerRadius: 20)
                            .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.height / 2 + 100)
                            .padding(.horizontal, 15.0)
                    }
                }
            }
        }
        .padding(.vertical, 10.0)
    }
}
