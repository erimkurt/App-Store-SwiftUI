//
//  ApplicationViewModel.swift
//  App Store
//
//  Created by Erim Kurt on 1/11/2563 BE.
//

import Foundation
import SwiftUI
import Combine

final class ApplicationViewModel: ObservableObject {
    
    @Published var lookUp: LookUp? {
        didSet {
            self.application = (lookUp?.results ?? []).first
        }
    }
    @Published var application: Application?
    
    
    public func fetchApplication(id: String) {
        WebService().getApplication(id: id, completion: { response in
            self.lookUp = response
        })
    }
}

