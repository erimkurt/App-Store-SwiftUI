//
//  TopFreeViewModel.swift
//  App Store
//
//  Created by Erim Kurt on 31/10/2563 BE.
//

import Foundation
import SwiftUI
import Combine

final class TopFreeViewModel: ObservableObject {
    
    init() {
        fetchApps()
    }
    
    @Published var feed: Feed? {
        didSet {
            self.apps = feed?.results ?? []
        }
    }
    @Published var apps = [Application]()
    
    private func fetchApps() {
        WebService().getTopFree(completion: { response in
            self.feed = response.feed
        })
    }
}
