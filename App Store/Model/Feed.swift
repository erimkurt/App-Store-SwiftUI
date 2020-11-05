//
//  Feed.swift
//  App Store
//
//  Created by Erim Kurt on 31/10/2563 BE.
//

import Foundation

struct Feed: Codable {
    let title: String
    let id: String
    let results: [Application]
}
