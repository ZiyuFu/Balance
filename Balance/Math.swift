//
//  GeneralMath.swift
//  Balance
//
//  Created by FuZiyu on 2020/4/15.
//  Copyright © 2020 zfu. All rights reserved.
//

import Foundation
import UIKit
import Darwin


class Math{
    
    
    
    
//    robot1.center = CGPoint(x: (screenSize.width * CGFloat((robot1Pos.value))) / CGFloat(2.9), y: robot1.center.y );
    class func robotCenter(sliderValue: Float, currentCenter: CGPoint) -> CGPoint {
        
        let x = CGFloat((Float(Constants.screenSize.width) * sliderValue) / Constants.sliderFullLength);
        let y = currentCenter.y;
        
        return CGPoint(x: x, y: y);
        
    }
    
    class func findTheta(m1: Double, m2: Double, m3: Double, d1: Double, d2: Double, d3: Double) -> Double{
        
        let dist1 = d1 - 1.45;
        let dist2 = d2 - 1.45;
        let dist3 = d3 - 1.45;

        let top = m1*dist1 + m2*dist2 + m3*dist3;
        let totalMass = m1 + m2 + m3;
        
        let bottom = totalMass * Constants.height + Constants.switchMass * Constants.height;
        
        let frac = -(top/bottom);
        return arctanDEG(num:frac)
        
        }
    
    class func arctanDEG(num: Double) -> Double{
        return atan(num) * 180 / Double.pi;
        
    }
    
}
