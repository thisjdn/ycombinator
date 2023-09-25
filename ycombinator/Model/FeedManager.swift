//
//  FeedManager.swift
//  ycombinator
//
//  Created by Jaden Hong on 2023-09-20.
//

import UIKit

class FeedManager {
    
    func updateFeed() {
        let myUrlString = myStringUrl()
        performRequest(urlString: myUrlString)
    }
    
    func myStringUrl() -> String {
        return "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"
    }
    
    func stringUrlForStory(Id: Int) -> String {
        return "https://hacker-news.firebaseio.com/v0/item/\(Id).json?print=pretty"
    }
    
    func performRequest(urlString: String) {
        if let safeURL = URL(string: urlString) {
            let request = URLRequest(url: safeURL)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error!)
                } 
                if let safeData = data {
                    self.parseJSONForId(data: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSONForId(data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([Int].self, from: data)
            
            let id = decodedData
//            make another API call using the ID returned from decodedData
            print("parseJSON Success : \(id)")
        } catch {
            print("error: \(error)")
            print("Description: \(error.localizedDescription)")
        }
    }
    
}
