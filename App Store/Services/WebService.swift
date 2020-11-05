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
        let api = "\(Config.baseProtocol)rss.\(Config.baseURL)/api/\(Config.version)/\(Config.region)/\(MediaType.iosApps.rawValue)/top-free/all/100/explicit.json"
        print(api)
        guard let url = URL(string: api) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let posts = try! JSONDecoder().decode(FeedResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
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
