//
//  ViewController.swift
//  MJBadgeButton
//
//  Created by flix on 24/10/16.
//  Copyright © 2016 Jaleel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var btnBarBadge : MJBadgeBarButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MJBadgeButton"
        
        let customButton = UIButton(type: UIButtonType.custom)
        customButton.frame = CGRect(x: 0, y: 0, width: 35.0, height: 35.0)
        customButton.addTarget(self, action: #selector(self.onBagdeButtonClick), for: .touchUpInside)
        customButton.setImage(UIImage(named: "Cart"), for: .normal)

        self.btnBarBadge = MJBadgeBarButton()
        self.btnBarBadge.setup(customButton: customButton)
        
//        self.btnBarBadge.shouldHideBadgeAtZero = true
//        self.btnBarBadge.shouldAnimateBadge = false
        
        self.btnBarBadge.badgeValue = "0"
        self.btnBarBadge.badgeOriginX = 20.0
        self.btnBarBadge.badgeOriginY = -4
        
        self.navigationItem.rightBarButtonItem = self.btnBarBadge
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onBagdeButtonClick() {
        print("button Clicked \(self.btnBarBadge.badgeValue)")
    }
    
    @IBAction func stepper_OnClick(_ sender: UIStepper) {
        btnBarBadge.badgeValue = "\(Int(sender.value))"
    }

}

