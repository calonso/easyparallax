//
//  ViewController.swift
//  EasyParallax
//
//  Created by Liam on 11/10/2014.
//  Copyright (c) 2014 Liam Flynn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set vertical effect
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffectType.TiltAlongVerticalAxis)
        
        verticalMotionEffect.minimumRelativeValue = -70.0
        verticalMotionEffect.maximumRelativeValue = 70.0
        
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffectType.TiltAlongHorizontalAxis)
        
        horizontalMotionEffect.minimumRelativeValue = -70.0
        horizontalMotionEffect.maximumRelativeValue = 70.0
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        // Add both effects to your view
        
        backgroundView.addMotionEffect(group)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

