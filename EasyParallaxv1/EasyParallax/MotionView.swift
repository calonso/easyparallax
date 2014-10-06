//
//  MotionView.swift
//  EasyParallax
//
//  Created by Carlos Alonso on 06/10/2014.
//  Copyright (c) 2014 MyDrive Solutions. All rights reserved.
//

import UIKit
import CoreMotion

class MotionView: UIView {
  
  @IBOutlet weak var label: UILabel?

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
  
  let mgr = CMMotionManager()
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    mgr.showsDeviceMovementDisplay = true
    mgr.deviceMotionUpdateInterval = 10.0 / 60.0
    
    mgr.startDeviceMotionUpdatesToQueue(NSOperationQueue(), withHandler: { motion, error in
      var x = Float(self.center.x) + Float(motion.gravity.x) * 5
      var y = Float(self.center.y) - Float(motion.gravity.y) * 5
      
      dispatch_async(dispatch_get_main_queue(), {
        self.center = CGPointMake(CGFloat(x), CGFloat(y))
      })
    })
  }
}
