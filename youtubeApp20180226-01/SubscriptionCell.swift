//
//  SubscriptionCell.swift
//  youtubeApp20180226-01
//
//  Created by Regio Abundan on 3/4/18.
//  Copyright © 2018 SwiftLYFE. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {

    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos: [Video]) in
            
            self.videos = videos
            self.collectionView.reloadData()
            
        }
    }
}
