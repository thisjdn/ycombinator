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
            let decodedIdData = try decoder.decode([Int].self, from: data)
            
            let id = decodedIdData[0]
//            we iterate through the tableView index here with [Int]
            performRequestForStory(id: id)
            print("parseJSON Success : \(id)")
        } catch {
            print("error: \(error)")
            print("Description: \(error.localizedDescription)")
        }
    }
    
    
    func performRequestForStory(id: Int) {
        
        if let safeUrl = URL(string: stringUrlForStory(Id: id)) {
            let request = URLRequest(url: safeUrl)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    self.parseJSONUsingIdForStory(data: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSONUsingIdForStory(data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedStoryData = try decoder.decode(DataModel.self, from: data)
            let name = decodedStoryData.title
            let link = decodedStoryData.url
            print("yay it works! \n\(name)\n\(link)")
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
}
