//
//  SelectionScreen.swift
//  Delegates-Protocols
//
//  Created by M78 on 9/10/18.
//  Copyright © 2018 Sean Allen. All rights reserved.
//

import UIKit

protocol SideSelectionDelegate {
    func didTapChoice(image: UIImage, sideName: String, backgroundColor: UIColor)
}


class SelectionScreen: UIViewController { // I am the boss!!!
    
    var sideSelectionDelegate: SideSelectionDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func imperialButtonTapped(_ sender: UIButton) {
        sideSelectionDelegate.didTapChoice(image: UIImage(named: "vader")!, sideName: "Darth Vader", backgroundColor: .red)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func rebelButtonTapped(_ sender: UIButton) {
        sideSelectionDelegate.didTapChoice(image: UIImage(named: "luke")!, sideName: "Luke Skywalker", backgroundColor: .cyan)
        dismiss(animated: true, completion: nil)
    }
    
    
}
