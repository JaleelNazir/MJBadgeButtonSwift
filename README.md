
1. Add MJBadgeBarButton.swift ito your Project.
2. create object ` var barButton = MJBadgeBarButton()` in Viewcontroller class

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
        print("MJBadgeButton Clicked")
        }
        @IBAction func stepper_OnClick(sender: UIStepper) {
        barButton.badgeValue = sender.value.toString()
        }
    
# The MIT License (MIT)

Copyright (c) 2015 JaleelNazir

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
