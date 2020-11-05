//
//  ImageLoader.swift
//  App Store
//
//  Created by Erim Kurt on 31/10/2563 BE.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    
    var data = Data() {
        didSet {
            if let image = UIImage(data: data) {
                self.image = image
            }
        }
    }
    @Published var image = UIImage()

    init (urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
