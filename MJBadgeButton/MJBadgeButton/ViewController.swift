//
//  ViewController.swift
//  MJBadgeButton
//
//  Created by Mohamed Jaleel Nazir on 12/5/15.
//  Copyright © 2015 MJ. All rights reserved.
//

import UIKit

extension Double {
    func toString() -> String {
        return String(format: "%d",Int(self))
    }
}

class ViewController: UIViewController {
    
    var barButton = MJBadgeBarButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MJBadgeButton"
        
        let image = UIImage(named: "Cart")
        
        let customButton = UIButton(type: UIButtonType.Custom) as UIButton
        customButton.frame = CGRectMake(0, 0, 35.0, 35.0)
        customButton .addTarget(self, action: "OnBagdeButtonClick", forControlEvents: UIControlEvents.TouchUpInside)
        customButton .setImage(image, forState: UIControlState.Normal)
        
        let MJBB_withBadge = MJBadgeBarButton()

        barButton = MJBB_withBadge.initWithCustomBadgeBarButton(customButton) as MJBadgeBarButton
        
        barButton.shouldHideBadgeAtZero = false
//        barButton.shouldAnimateBadge = false
        barButton.badgeValue = "0"
        barButton.badgeOriginX = 20.0
        barButton.badgeOriginY = -4
        
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func OnBagdeButtonClick()
    {
        print("button Clicked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stepper_OnClick(sender: UIStepper) {
        barButton.badgeValue = sender.value.toString()
    }
}

