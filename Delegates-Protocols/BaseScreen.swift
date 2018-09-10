//
//  ViewController.swift
//  Delegates-Protocols
//
//  Created by Sean Allen on 5/20/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import UIKit

class BaseScreen: UIViewController {

    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let light = Notification.Name(rawValue: NotificationKeys.lightNotificationkey)
    let dark = Notification.Name(rawValue: NotificationKeys.darkNotificationkey)
    
    deinit {
        // Never forget to deallocate form memory!
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.height / 2
        createObservers()
    }

    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        present(selectionVC, animated: true, completion: nil)
//        createObservers() // Explore! It works!
    }
    
    func createObservers() {
        // Light
        NotificationCenter.default.addObserver(self, selector: #selector(updateImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateNameLabel(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: light, object: nil)
        
        // Dark
        NotificationCenter.default.addObserver(self, selector: #selector(updateImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateNameLabel(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: dark, object: nil)
    }
    
    @objc func updateImage(notification: Notification) {
        let isLight = notification.name == light
        let image = isLight ? UIImage(named: "luke")! : UIImage(named: "vader")!
        mainImageView.image = image
    }
    
    @objc func updateNameLabel(notification: Notification) {
        let isLight = notification.name == light
        let name = isLight ? "Luke Skywalker" : "Darth Vader"
        nameLabel.text = name
        if name == "Luke Skywalker" {
            nameLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }
    
    @objc func updateBackground(notification: Notification) {
        let isLight = notification.name == light
        let color = isLight ? UIColor.cyan : .red
        view.backgroundColor = color
    }
    
}

