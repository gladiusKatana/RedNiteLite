import UIKit    //    RedNiteLite   created by Garth Snyder

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var nightLightViewController = UIViewController()
    lazy var orientationLock = UIInterfaceOrientationMask.all // set orientations you want allowed by default
    
    func application(_ application: UIApplication,
                     willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .red // will likely add a nicer, custom (researched) optimal red color
        window?.makeKeyAndVisible()
        
        let backgroundVC = UIViewController()
        backgroundVC.view.backgroundColor = window?.backgroundColor /// must match window's background color, for rotating landscape->portrait
        
        UINavigationBar.appearance().barTintColor = .red
        UINavigationBar.appearance().shadowImage = UIImage()
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navController = UINavigationController(rootViewController: nightLightViewController)
        window?.rootViewController = navController
        
        AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)    // locked to landscape to hide status bar for cleaner look
        return true
    }
}

extension AppDelegate {
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }
}

struct AppUtility {
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.orientationLock = orientation
        }
        else {
            print("[AppUtility] error casting app delegate instance")
        }
    }
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation: UIInterfaceOrientation) {
        
        self.lockOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
    
}


//    This is definitely the shortest useful iOS app I've ever written      created by Garth Snyder

