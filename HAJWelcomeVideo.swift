//
//  HAJWelcomeVideo.swift
//  Skriv3
//
//  Created by Hicham Abou Jaoude on 2014-07-24.
//  Copyright (c) 2014 Hicham Abou Jaoude. All rights reserved.
//

import AVFoundation
import QuartzCore
import CoreMedia

class HAJWelcomeVideo: NSObject {
    
    var avPLayer = AVPlayer()
    var movieView = UIView()
    var view = UIView() // Set this when initializing
    
    func welcomeWithVideo(videoName: String, view: UIView) -> (){
        
        self.view = view
        self.movieView.frame = self.view.frame
        
        var bundle = NSBundle.mainBundle()
        var moviePath = bundle.pathForResource(videoName, ofType: "mp4")
        var movieURL = NSURL.fileURLWithPath(moviePath)
        
        var avAsset: AVAsset = AVAsset.assetWithURL(movieURL) as AVAsset
        var avPlayerItem = AVPlayerItem(asset: avAsset)
        self.avPLayer = AVPlayer(playerItem: avPlayerItem)
        var avPLayerLayer = AVPlayerLayer(player: self.avPLayer)
        avPLayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        avPLayerLayer.frame = self.view.frame
        self.movieView.layer.addSublayer(avPLayerLayer)
        
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        self.avPLayer.seekToTime(kCMTimeZero)
        self.avPLayer.volume = 0;
        self.avPLayer.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerItemDidReachEnd:", name: AVPlayerItemDidPlayToEndTimeNotification, object: self.avPLayer.currentItem)

    }
    
    func playerItemDidReachEnd(notification: NSNotification) -> (){
        var p = notification.object as AVPlayerItem
        p.seekToTime(kCMTimeZero)
    }
}
