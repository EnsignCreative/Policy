//
//  AppDelegate.swift
//  Policy
//
//  Created by Bradley Ensign on 5/26/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate { // PushNotifications, AdsProtocol

    var window: UIWindow?
    var sceneName = "Default Configuration"
    let persistentContainerName = "Policy"

    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        finishConfigurations()
        window?.makeKeyAndVisible()
        return true
    }
    

    private func finishConfigurations() {
//        FirebaseApp.configure()
//        checkTrackingPrivileges()
//        registerForPushNotifications()
    }
    

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: sceneName, sessionRole: connectingSceneSession.role)
    }
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
//        NotificationCenter.default.post(name: .googleSignedIn, object: nil, userInfo: userInfo)
    }

    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: persistentContainerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()


    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do { try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}






//extension AppDelegate {
//
//    @available(iOS 9.0, *)
//    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
//        return GIDSignIn.sharedInstance.handle(url)
//    }
//
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        guard error != nil else { return }
//        NotificationCenter.default.post(name: .googleSignedIn, object: nil)
//    }
//}
//
//
//extension NSNotification.Name {
//    static var googleSignedIn: NSNotification.Name {
//        return .init(rawValue: #function)
//    }
//}




