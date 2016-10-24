#MJBadgeButtonSwift
![MJBadgeButtonSwift](https://3.bp.blogspot.com/-arcHZMmLh3w/WA4gBJkGRFI/AAAAAAAAAtQ/jg2iNQqz8OwhfZpXtjZfQmq3kni9hlVPgCK4B/s1600/MJBadgeButtonSwift.png)

Add MJBadgeBarButton.swift ito your Project.

        var barButton : MJBadgeBarButton!

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
