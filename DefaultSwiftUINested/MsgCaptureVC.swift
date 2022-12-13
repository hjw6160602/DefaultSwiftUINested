//
//  TableViewController.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/13.
//

import UIKit
import SwiftUI

class MsgCaptureVC: NSObject {

    @objc func makeCaptureView() -> UIViewController {
        if #available(iOS 13.0, *) {
            return UIHostingController(rootView:  MsgCaptureTableView())
        } else {
            return UIViewController()
        }
    }
}
