HAJWelcomeVideo
===============
`HAJWelcomeVideo` is a modular video cover which allows you to easily add a video as your ViewController's background. This feature can be used for Welcome-Screens, Set-Up Videos, etc. Inspired by  [bichenkk/VideoCover-iOS][]
[bichenkk/VideoCover-iOS]: https://github.com/bichenkk/VideoCover-iOS

![alt tag](https://github.com/hichamoaj/HAJWelcomeVideo/blob/master/hajwelcomevideo.gif)

Installation
===============
To use the `HAJWelcomeVideo` object. `import HAJWelcomeVideo` to your Swift ViewController.

Create `var welcomeVideoObject = HAJWelcomeVideo()` in your Swift file.

In `viewDidLoad()`:
```
self.welcomeVideoObject.welcomeWithVideo("videoNameHere", type: "typeHere(mp4)", startTime: CMTimeMake(startTimeInt, 1), endTime: CMTimeMake(endTimeInt, 1), gradientArray: NSArray(objects: UIColor.blackColor().CGColor, UIColor.clearColor().CGColor, etc.. ), view: self.view)
self.view.addSubview(self.welcomeVideoObject.movieView)
self.view.addSubview(self.welcomeVideoObject.gradientView)
```
Then in `viewWillDisappear()`:
```
self.welcomeVideoObject.avPLayer.pause()
```
And in `viewDidAppear()`
```
self.welcomeVideoObject.avPLayer.play()
```
