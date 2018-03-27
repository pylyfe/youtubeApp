//
//  ApiService.swift
//  youtubeApp20180226-01
//
//  Created by Regio Abundan on 3/2/18.
//  Copyright © 2018 SwiftLYFE. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance  = ApiService()
    let baseURL = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(_ completion: @escaping ([Video]) -> ()) {
        fetchFeedForURLString(urlString: "\(baseURL)/home.json", completion: completion)
    }
    
    func fetchTrendingFeed(_ completion: @escaping ([Video]) -> ()) {
        fetchFeedForURLString(urlString: "\(baseURL)/trending.json", completion: completion)
    }

    func fetchSubscriptionFeed(_ completion: @escaping ([Video]) -> ()) {
        fetchFeedForURLString(urlString: "\(baseURL)/subscriptions.json", completion: completion)
    }
    

    func fetchFeedForURLString(urlString: String, completion: @escaping ([Video]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                    let video = Video()
                    
                    video.setValuesForKeys(dictionary)
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.setValuesForKeys(channelDictionary)
                    
                    video.channel = channel
                    
                    videos.append(video)
                }
                
                DispatchQueue.main.async(execute: {
                    completion(videos)
                })
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
            
        }) .resume()
    }
}

//let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)

//var videos = [Video]()

//for dictionary in json as! [[String: AnyObject]] {
    
//    let video = Video()
//    video.title = dictionary["title"] as? String
//    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
    
//    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
    
//    let channel = Channel()
//    channel.name = channelDictionary["name"] as? String
//    channel.profileImageName = channelDictionary["profile_image_name"] as? String
    
//    video.channel = channel
    
//    videos.append(video)
//}

//DispatchQueue.main.async(execute: {
//    completion(videos)
//})

//} catch let jsonError {
//    print(jsonError)
//}
            
