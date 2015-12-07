//
//  MJBadgeBarButton.swift
//  MJBadgeButton
//
//  Created by Mohamed Jaleel Nazir on 12/5/15.
//  Copyright © 2015 MJ. All rights reserved.
//

import Foundation
import UIKit

class MJBadgeBarButton: UIBarButtonItem {
    
    // Badge value to be display
    
    var badgeValue : String = "" {
        didSet{
            if ((self.badgeValue == "0") && self.shouldHideBadgeAtZero == true) || self.badgeValue.isEmpty
            {
                removeBadge()
            }
            else if ((self.badge.text?.isEmpty) != nil)
            {
                updateBadgeValueAnimated(true)
            }
            else
            {
                self.badge = UILabel . init(frame: CGRectMake(self.badgeOriginX, self.badgeOriginY, 20.0, 20.0))
                self.badge.textColor = self.badgeTextColor
                self.badge.backgroundColor = self.badgeBGColor
                self.badge.font = self.badgeFont
                self.badge.textAlignment = NSTextAlignment .Center
                self.customView?.addSubview(self.badge)
                
                updateBadgeValueAnimated(true)
            }
        }
    }
    
    // Badge background color
    var badgeBGColor = UIColor()
    // Badge text color
    var badgeTextColor = UIColor()
    // Badge font
    var badgeFont = UIFont()
    // Padding value for the badge
    var badgePadding = CGFloat()
    // Minimum size badge to small
    var badgeMinSize = CGFloat()
    //Values for offseting the badge over the BarButtonItem you picked
    //Values for offseting the badge over the BarButtonItem you picked
    
    var badgeOriginX : CGFloat = 0 {
        didSet {
            updateBadgeFrame()
        }
    }
    var badgeOriginY : CGFloat = 0{
        didSet {
            updateBadgeFrame()
        }
    }

    // In case of numbers, remove the badge when reaching zero
    var shouldHideBadgeAtZero = Bool()
    // Badge has a bounce animation when value changes
    var shouldAnimateBadge = Bool()
    
    // The badge displayed over the BarButtonItem
    var badge = UILabel()
    
    
    func initWithCustomBadgeBarButton(customButton : UIButton) -> MJBadgeBarButton
    {
        self.customView = customButton
        initializer()
        return self
    }
    
    func printAndCount(stringToPrint: String) -> Int {
        print(stringToPrint)
        return stringToPrint.characters.count
    }
    
    func initializer()
    {
        self.badgeBGColor = UIColor.redColor()
        self.badgeTextColor = UIColor.whiteColor()
        
        self.badgeFont = UIFont.systemFontOfSize(14.0)
        self.badgePadding = 4.0
        self.badgeMinSize = 10.0
        self.badgeOriginX = 0
        self.badgeOriginY = 0
        self.shouldHideBadgeAtZero = true
        self.shouldAnimateBadge = true
        self.customView?.clipsToBounds = false
    }
    
    func updateBadgeFrame()
    {
        let lbl_Frame = duplicateLabel(self.badge)
        lbl_Frame.sizeToFit()
        
        let expectedLabelSize = lbl_Frame.frame.size
        
        var minHeight = expectedLabelSize.height
        minHeight = (minHeight < self.badgeMinSize) ? self.badgeMinSize : expectedLabelSize.height
        
        var minWidth = expectedLabelSize.width
        minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width
        
        let padding = self.badgePadding
        
        self.badge.frame = CGRectMake(self.badgeOriginX, self.badgeOriginY, minWidth + padding, minHeight + padding)
        self.badge.layer.cornerRadius = self.badge.frame.width / 2
        self.badge.layer.masksToBounds = true
    }
    
    func duplicateLabel(lbl_ToCopy : UILabel) -> UILabel
    {
        let lbl_duplicate = UILabel .init(frame: lbl_ToCopy.frame)
        lbl_duplicate.text = lbl_ToCopy.text
        lbl_duplicate.font = lbl_ToCopy.font

        return lbl_duplicate
    }
    
    func updateBadgeValueAnimated(animated : Bool)
    {
        if(animated == true && self.shouldAnimateBadge && self.badge.text != self.badgeValue)
        {
            let animation = CABasicAnimation .init(keyPath: "transform.scale")
            animation.fromValue = 1.5
            animation.toValue = 1
            animation.duration = 0.2
            animation.timingFunction = CAMediaTimingFunction .init(controlPoints: 0.4, 1.3, 1, 1)
            self.badge.layer.addAnimation(animation, forKey: "bounceAnimation")
        }
        self.badge.text = self.badgeValue
        updateBadgeFrame()
    }
    
    func removeBadge()
    {
        UIView . animateWithDuration(0.2, animations: {
            self.badge.transform = CGAffineTransformMakeScale(0, 0)
            }, completion:{
                 (value: Bool) in
                self.badge .removeFromSuperview()
        })
    }
}
