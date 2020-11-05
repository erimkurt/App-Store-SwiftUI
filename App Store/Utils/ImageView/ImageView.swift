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

    var size: CGFloat = 60.0
    
    init (withURL url: String, size: CGFloat = 60.0) {
        imageLoader = ImageLoader(urlString: url)
        self.size = size
    }

    var body: some View {
        
        Image(uiImage: imageLoader.image)
            .resizable()
            .frame(width: size, height: size)
            .clipShape(
                RoundedRectangle(cornerRadius: size / 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: size / 4)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
    }
}
