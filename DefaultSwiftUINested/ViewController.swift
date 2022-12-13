//
//  ViewController.swift
//  DefaultSwiftUINested
//
//  Created by SaiDiCaprio on 2022/12/13.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func imMsgCaptureDicClick(_ sender: Any) {
        let msgCaptureVC = MsgCaptureVC().makeCaptureView()
        msgCaptureVC.view.backgroundColor = .white
        self.navigationController?.pushViewController(msgCaptureVC, animated: true)
    }
    
}

