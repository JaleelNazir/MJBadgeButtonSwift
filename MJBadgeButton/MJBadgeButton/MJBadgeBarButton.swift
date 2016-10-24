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
        didSet {
            if (self.badgeValue == "0" && self.shouldHideBadgeAtZero == true) || self.badgeValue.isEmpty {
                self.removeBadge()
            } else {
                self.badge.isHidden = false
                self.updateBadgeValueAnimated(animated: true)
            }
        }
    }
    
    // Badge background color
    var badgeBGColor = UIColor.red
    
    // Badge text color
    var badgeTextColor = UIColor.white
    
    // Badge font
    var badgeFont = UIFont()
    
    // Padding value for the badge
    var badgePadding = CGFloat()
    
    // Minimum size badge to small
    var badgeMinSize = CGFloat()
    
    //Values for offseting the badge over the BarButtonItem you picked
    var badgeOriginX : CGFloat = 0 {
        didSet {
            self.updateBadgeFrame()
        }
    }
    var badgeOriginY : CGFloat = 0 {
        didSet {
            self.updateBadgeFrame()
        }
    }

    // In case of numbers, remove the badge when reaching zero
    var shouldHideBadgeAtZero = true
    
    // Badge has a bounce animation when value changes
    var shouldAnimateBadge = true
    
    // The badge displayed over the BarButtonItem
    var badge = UILabel()
    
    //MARK: - init
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: -
    func setup(customButton: UIButton) {
        
        self.customView = customButton
        
        self.badgeBGColor = UIColor.red
        self.badgeTextColor = UIColor.white
        self.badgeFont = UIFont.systemFont(ofSize: 14.0)
        self.badgePadding = 4.0
        self.badgeMinSize = 10.0
        self.badgeOriginX = 0
        self.badgeOriginY = 0
        self.shouldHideBadgeAtZero = true
        self.shouldAnimateBadge = true
        self.customView?.clipsToBounds = false
        
        self.badge = UILabel(frame: CGRect(x: self.badgeOriginX, y: self.badgeOriginY, width: 20.0, height: 20.0))
        self.badge.textColor = self.badgeTextColor
        self.badge.backgroundColor = self.badgeBGColor
        self.badge.font = self.badgeFont
        self.badge.textAlignment = NSTextAlignment.center
        self.badge.text = ""
        self.customView?.addSubview(self.badge)
        self.updateBadgeValueAnimated(animated: true)
    }
    
    
    func updateBadgeFrame() {
        let lbl_Frame = duplicateLabel(lblCopy: self.badge)
        lbl_Frame.sizeToFit()
        
        let expectedLabelSize = lbl_Frame.frame.size
        
        var minHeight = expectedLabelSize.height
        minHeight = (minHeight < self.badgeMinSize) ? self.badgeMinSize : expectedLabelSize.height
        
        var minWidth = expectedLabelSize.width
        minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width
        
        let padding = self.badgePadding
        self.badge.frame = CGRect(x: self.badgeOriginX, y: self.badgeOriginY, width: minWidth + padding, height: minHeight + padding)
        self.badge.layer.cornerRadius = self.badge.frame.width / 2
        self.badge.layer.masksToBounds = true
    }
    
    func duplicateLabel(lblCopy: UILabel) -> UILabel {
        let lbl_duplicate = UILabel(frame: lblCopy.frame)
        lbl_duplicate.text = lblCopy.text
        lbl_duplicate.font = lblCopy.font

        return lbl_duplicate
    }
    
    func updateBadgeValueAnimated(animated : Bool) {
        if(animated == true && self.shouldAnimateBadge && self.badge.text != self.badgeValue) {
            let animation = CABasicAnimation .init(keyPath: "transform.scale")
            animation.fromValue = 1.5
            animation.toValue = 1
            animation.duration = 0.2
            animation.timingFunction = CAMediaTimingFunction .init(controlPoints: 0.4, 1.3, 1, 1)
            self.badge.layer.add(animation, forKey: "bounceAnimation")
        }
        self.badge.text = self.badgeValue
        self.updateBadgeFrame()
    }
    
    func removeBadge() {
        UIView.animate(withDuration: 0.3) { 
            self.badge.isHidden = true
        }
    }
}
