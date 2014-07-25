//  Created by Hicham Abou Jaoude on 2014-07-24.
//  Copyright (c) 2014 Hicham Abou Jaoude. All rights reserved.

import AVFoundation
import QuartzCore
import CoreMedia

class HAJWelcomeVideo: NSObject {
    
    var avPLayer = AVPlayer()
    var movieView = UIView()
    var view = UIView() // Set this when initializing
    var gradientView = UIView()
    var startTime = CMTimeMake(0, 1)
    
    func welcomeWithVideo(videoName: String, type: String, startTime: CMTime, endTime: CMTime, gradientArray: NSArray, view: UIView) -> (){
        
        self.view = view
        self.movieView.frame = self.view.frame
        self.startTime = startTime
        
        var bundle = NSBundle.mainBundle()
        var moviePath = bundle.pathForResource(videoName, ofType: type)
        var movieURL = NSURL.fileURLWithPath(moviePath)
        
        var avAsset: AVAsset = AVAsset.assetWithURL(movieURL) as AVAsset
        var avPlayerItem = AVPlayerItem(asset: avAsset)
        avPlayerItem.forwardPlaybackEndTime = endTime
        self.avPLayer = AVPlayer(playerItem: avPlayerItem)
        var avPLayerLayer = AVPlayerLayer(player: self.avPLayer)
        avPLayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        avPLayerLayer.frame = self.view.frame
        self.movieView.layer.addSublayer(avPLayerLayer)
        
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        self.avPLayer.seekToTime(startTime)
        self.avPLayer.volume = 0;
        self.avPLayer.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerItemDidReachEnd:", name: AVPlayerItemDidPlayToEndTimeNotification, object: self.avPLayer.currentItem)
        
        var gradient = CAGradientLayer()
        self.gradientView.frame = self.movieView.frame
        gradient.frame = self.gradientView.bounds
        let arrayColors: Array <AnyObject> = gradientArray
        gradient.colors = arrayColors
        self.gradientView.layer.insertSublayer(gradient, atIndex: 0)

    }
    
    func playerItemDidReachEnd(notification: NSNotification) -> (){
        var p = notification.object as AVPlayerItem
        p.seekToTime(self.startTime)
    }
}
