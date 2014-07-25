HAJWelcomeVideo
===============
`HAJWelcomeVideo` is a modular video cover which allows you to easily add a video as your ViewController's background. This feature can be used for Welcome-Screens, Set-Up Videos, etc. Inspired by  [bichenkk/VideoCover-iOS][]
[bichenkk/VideoCover-iOS]: https://github.com/bichenkk/VideoCover-iOS

Installation
===============
To use the `HAJWelcomeVideo` object. `import HAJWelcomeVideo` to your Swift ViewController.

In `viewDidLoad()`:
```
`var welcomeVideoObject = HAJWelcomeVideo()`
`welcomeVideoObject.welcomeWithVideo("videoNameHere", view: self.view)`
`self.view.addSubview(self.welcomeVideoObject.movieView)`
```
Then in `viewWillDisappear()`:
```
`self.welcomeVideoObject.avPLayer.pause()`
```
And in `viewDidAppear()`
```
`self.welcomeVideoObject.avPLayer.play()`
```
