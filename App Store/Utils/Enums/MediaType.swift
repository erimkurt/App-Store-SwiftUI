//
//  MediaType.swift
//  App Store
//
//  Created by Erim Kurt on 31/10/2563 BE.
//

import Foundation

enum MediaType: String, Decodable {
    case appleMusic = "apple-music"
    case itunesMusic = "itunes-music"
    case iosApps = "apps"
    case books = "books"
    case movies = "movies"
    case itunesU = "itunes-u"
    case podcasts = "podcasts"
    case musicVideos = "music-videos"
}
