//
//  GeneralMath.swift
//  Balance
//
//  Created by FuZiyu on 2020/4/15.
//  Copyright © 2020 zfu. All rights reserved.
//

import Foundation
import UIKit


class Math{
    
    
    
    
//    robot1.center = CGPoint(x: (screenSize.width * CGFloat((robot1Pos.value))) / CGFloat(2.9), y: robot1.center.y );
    class func robotCenter(sliderValue: Float, currentCenter: CGPoint) -> CGPoint {
        
        let x = CGFloat((Float(Constants.screenSize.width) * sliderValue) / Constants.sliderFullLength);
        let y = currentCenter.y;
        
        return CGPoint(x: x, y: y);
        
    }
    
    
}
