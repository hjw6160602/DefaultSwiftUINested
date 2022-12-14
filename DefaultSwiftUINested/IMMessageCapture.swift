//
//  IMMessageCaptureVC.swift
//  NewQiXiuApp
//
//  Created by SaiDiCaprio on 2022/12/13.
//  Copyright © 2022 iqiyi. All rights reserved.
//

//#if DEBUG

import UIKit
import SwiftUI

class IMMessageCapture: NSObject {
    
    @objc static let shared = IMMessageCapture()
    
    var messageList = [Message]()
    
    private override init() {
        super.init()
    }
    
    @objc func addNotificationObserver() {

        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveImMessageNoti),
                                               name: NotificationNameMessageCapture,
                                               object: nil)
    }
    
    
    @objc lazy var captureViewController: UIViewController = {
        let messageListView = MessageListView(messageList: dataStoreList)
        let hostViewController = UIHostingController(rootView:  messageListView)
        return hostViewController
    }()
}

extension IMMessageCapture {
    @objc func didReceiveImMessageNoti(_ notification: Notification) {
        let noti = notification.object
        guard noti is [String: Any] else {
            return
        }
        let jsonDict: [String: Any] = noti as! [String: Any]
        let jsonString = JSONString(jsonDict)

        let jsonData: Data = jsonString.data(using:String.Encoding.utf8)!
        let message: Message? = try? JSONDecoder().decode(Message.self,from:jsonData)

        message?.json = jsonString
        if let message = message {
            self.messageList.append(message)
        }
    }
}

//#endif
