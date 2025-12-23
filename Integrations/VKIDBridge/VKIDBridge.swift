//
//  VKBridge.swift
//  VKBridge
//
//  Created by LorrestGump on 2025/12/23.
//

import Foundation
import UIKit
import VKID


//@objc public class VKIDBridge : NSObject{
@objc public class VKIDInterface : NSObject{
    
    private var vkid : VKID?
    
@objc public func config(clientId:NSString,clientSecret:NSString){
        do {
//            let vkid = try VKID(
//                config: Configuration(
//                    appCredentials: AppCredentials(
//                        clientId: clientId as String,         // ID вашего приложения (app_id)
//                        clientSecret: clientSecret as String  // ваш защищенный ключ (client_secret)
//                    )
//                )
//            )
            try VKID.shared.set(config: Configuration(
                appCredentials: AppCredentials(
                    clientId: clientId as String,         // ID вашего приложения (app_id)
                    clientSecret: clientSecret as String  // ваш защищенный ключ (client_secret)
                    )
                )
            )
            self.vkid = VKID.shared;
        } catch {
            preconditionFailure("Failed to initialize VKID: \(error)")
        }
    }
    
    
//@objc    public func authorize(complete:@escaping (Int,String) -> Void){
//
//    self.vkid!.authorize(
//        using: .uiViewController((UIApplication.shared.keyWindow?.rootViewController)!)
//       ) { result in
//           do {
//               let session = try result.get()
//               print("Auth succeeded with token: \(session.accessToken) and user info: \(session.user)")
//               complete(session.accessToken.userId.value,session.accessToken.value)
//           } catch AuthError.cancelled {
//               print("Auth cancelled by user")
//               complete(0,"")
//           } catch {
//               print("Auth failed with error: \(error)")
//               complete(0,"")
//           }
//       }
//    }
    
    // 将整个类或此方法标记为在主线程上执行
    @MainActor // 标记此方法在主线程上执行
    @objc public func authorize(complete: @escaping (Int, String) -> Void) {
        // 在 MainActor 上下文内，可以安全地访问 UIApplication.shared.属性
        guard let rootViewController = UIApplication.safeKeyWindowRootViewController else {
            print("Auth failed: Could not get Root View Controller.")
            complete(0, "")
            return
        }

        self.vkid!.authorize(
            using: .uiViewController(rootViewController) // 使用安全获取的 ViewController
        ) { result in
            // 授权库的回调通常会回到主线程，但为了安全起见，这里可以保持原样
            do {
                let session = try result.get()
                print("Auth succeeded with token: \(session.accessToken) and user info: \(session.user)")
                // 回调 complete 也需要在主线程上进行，但由于 complete 通常在授权库的内部线程上执行，
                // 且该闭包不涉及 UI，此处保持原样。如果 complete 内部有 UI 操作，则需要 MainActor.run。
                complete(session.accessToken.userId.value, session.accessToken.value)
            } catch let AuthError.cancelled {
                print("Auth cancelled by user")
                complete(0, "")
            } catch {
                print("Auth failed with error: \(error)")
                complete(0, "")
            }
        }
    }
    
    

@objc    public func open(url: URL) -> Bool {
        self.vkid!.open(url: url)
    }
 
}

extension UIApplication {
    /**
     返回当前应用程序的关键窗口 (Key Window) 上的 Root View Controller。
     此属性必须在主线程上访问。
     */
    static var safeKeyWindowRootViewController: UIViewController? {
        // 1. 获取所有连接的场景
        let windowScenes = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
        
        // 2. 查找活动或处于前台的场景
        let activeScene = windowScenes
            .filter { $0.activationState == .foregroundActive }
            .first

        // 3. 查找该场景中的 Key Window
        let keyWindow = activeScene?.windows
            .first(where: { $0.isKeyWindow })
        
        // 4. 返回 Key Window 上的 Root View Controller
        return keyWindow?.rootViewController
    }
}
