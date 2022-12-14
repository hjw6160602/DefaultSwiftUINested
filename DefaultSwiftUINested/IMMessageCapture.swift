//
//  TableViewController.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/13.
//

import UIKit
import SwiftUI

@objc
class IMMessageCapture: NSObject {
    
    @objc static let shared = IMMessageCapture()
    
    let captureView = MsgCaptureTableView()
    
    var isAddedNotification = false
    
    private override init() {
        super.init()
    }
    
    @objc func addNotificationObserver(_ notiName: String) {
        if isAddedNotification {
            return
        }
        let kNotificationName = Notification.Name(notiName)
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveImMessageNoti), name: kNotificationName, object: nil)
        isAddedNotification = true
    }
    
    @objc func didReceiveImMessageNoti(_ notification: Notification) {
        let noti = notification.object
        guard noti is [String: Any] else {
            return
        }
        let message: [String: Any] = noti as! [String: Any]
        
        print(message)
    }
    
    @objc lazy var captureViewController: UIViewController = {
        if #available(iOS 13.0, *) {
            return UIHostingController(rootView:  captureView)
        } else {
            return UIViewController()
        }
    }()
}
