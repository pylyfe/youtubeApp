//
//  Video.swift
//  youtubeApp20180226-01
//
//  Created by Regio Abundan on 2/28/18.
//  Copyright © 2018 SwiftLYFE. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var uploadDate: NSDate?
    var duration: NSNumber?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profile_image_name: String?
}
