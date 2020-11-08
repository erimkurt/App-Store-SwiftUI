//
//  ImageView.swift
//  App Store
//
//  Created by Erim Kurt on 31/10/2563 BE.
//

import Foundation
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader

    var cornerRadius: CGFloat = 60.0
    
    init (withURL url: String, cornerRadius: CGFloat = 60.0) {
        imageLoader = ImageLoader(urlString: url)
        self.cornerRadius = cornerRadius
    }

    var body: some View {
        
        Image(uiImage: imageLoader.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
    }
}
