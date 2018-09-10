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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseButton.layer.cornerRadius = chooseButton.frame.height / 2
        
        
    }

    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        
        //
        selectionVC.sideSelectionDelegate = self
        
        present(selectionVC, animated: true, completion: nil)
    }
    
    
}

extension BaseScreen: SideSelectionDelegate {
    func didTapChoice(image: UIImage, sideName: String, backgroundColor: UIColor) {
        self.mainImageView.image = image
        self.nameLabel.text = sideName
        self.view.backgroundColor = backgroundColor
    }
    
    
}
