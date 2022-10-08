//
//  NetworkManager.swift
//  Assignment-SwiftUI
//
//  Created by Unthinkable-mac-0040 on 11/06/21.
//

import Foundation
import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    /**
     Triggers to fetch data from given URl.
     For any other url fetching, just change the url and Results swift file according to coming data to give decoder.
     
     - Returns: Provide fetched data in results to be used to populate on List
     */
    func fetchData() {
        guard let url = URL(string: Link.api) else {return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
}
