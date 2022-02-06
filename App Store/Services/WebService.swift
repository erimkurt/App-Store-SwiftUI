//
//  App Store.swift
//  iTunes
//
//  Created by Erim Kurt on 30/10/2563 BE.
//

import Foundation
import Alamofire

class WebService {
    func getTopFree(completion: @escaping (FeedResponse) -> ()) {
        let api = "\(Config.baseProtocol)rss.\(Config.baseURLMarketingTools)/api/\(Config.version)/\(Config.region)/\(MediaType.iosApps.rawValue)/top-free/50/apps.json"
        print(api)
        AF.request(api, method: .get)
            .responseDecodable(of: FeedResponse.self) { (response) in
                guard let feed = response.value else { return }
                completion(feed)
            }
    }
    
    func getApplication(id: String, completion: @escaping (LookUp) -> ()) {
        let api = "\(Config.baseProtocol)\(Config.baseURL)/\(Config.region)/lookup?id=\(id)"
        print(api)
        AF.request(api, method: .get)
            .responseDecodable(of: LookUp.self) { (response) in
                guard let lookUp = response.value else { return }
                completion(lookUp)
            }
    }
}
