//
//  SelectionScreen.swift
//  Delegates-Protocols
//
//  Created by M78 on 9/10/18.
//  Copyright © 2018 Sean Allen. All rights reserved.
//

import UIKit

class SelectionScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func imperialButtonTapped(_ sender: UIButton) {
        
        NotificationCenter.default.post(name:  Notification.Name(rawValue: NotificationKeys.darkNotificationkey), object: nil)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func rebelButtonTapped(_ sender: UIButton) {
        NotificationCenter.default.post(name:  Notification.Name(rawValue: NotificationKeys.lightNotificationkey), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
}
