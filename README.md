# sims-ios

[![CI Status](http://img.shields.io/travis/John Nilsen/sims-ios.svg?style=flat)](https://travis-ci.org/John Nilsen/sims-ios)
[![Version](https://img.shields.io/cocoapods/v/sims-ios.svg?style=flat)](http://cocoapods.org/pods/sims-ios)
[![License](https://img.shields.io/cocoapods/l/sims-ios.svg?style=flat)](http://cocoapods.org/pods/sims-ios)
[![Platform](https://img.shields.io/cocoapods/p/sims-ios.svg?style=flat)](http://cocoapods.org/pods/sims-ios)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Sims is currently under development. To install sims please add it as a submodule to your project

```
$ git submodule add git@github.com:tapglue/sims-ios.git externals/sims
```

then add it as a pod to your podfile:

```Ruby
pod 'TapglueSims', :path => '<your app>/externals/sims/'
```

## Configuration

For sims to work it need to be configured with a token, url session and device token. Your application delegate should look something like this:

```Swift
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        sims = TapglueSims(appToken: appToken, url: url)
        registerForPushNotifications(application)
        let customConfig = yourConfiguration
        customConfig.loggingEnabled = true
        Tapglue.setUpWithAppToken(appToken, andConfig: customConfig)
        
        Tapglue.setSessionTokenNotifier(sims)
        return true
    }
    func registerForPushNotifications(application: UIApplication) {
        sims.registerSimsNotificationSettings(application)
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        if notificationSettings.types != .None {
            application.registerForRemoteNotifications()
        }
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        sims.registerDeviceToken(deviceToken)
    }
```

If you don't have a custom **URL** from Tapglue, that just the default one: `https://api.tapglue.com`

For more details on APNs registration be sure to check apple's own documentation. 

## Application APNs Certificate

For sims to work we also need your apps APNs certificate in p12 format. This procedure is currently manual, please contact us for more information.

## Author

John Nilsen, john@tapglue.com

## License

sims-ios is available under the MIT license. See the LICENSE file for more info.
