//
//  ViewController.swift
//  Balance
//
//  Created by Ziyu Fu on 2/10/20.
//  Copyright © 2020 zfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var robot1Mass: UITextField!
    @IBOutlet weak var robot2Mass: UITextField!
    @IBOutlet weak var robot3Mass: UITextField!
    
    @IBOutlet weak var robot1Pos: UISlider!
    @IBOutlet weak var robot2Pos: UISlider!
    @IBOutlet weak var robot3Pos: UISlider!
    
    @IBOutlet weak var results: UILabel!
    
    
    @IBOutlet weak var robot1: UIImageView!
    @IBOutlet weak var robot2: UIImageView!
    @IBOutlet weak var robot3: UIImageView!
    
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    let switchMass = 93.0; //lb
    var totalMass = 0.0;
    var theta = 0.0; //degree
    var height = 1.228725; //meters
    var switchCenterOfMass = 1.45; //meters from the left
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //initialize position for three ImageView objects.
        robot1.center = CGPoint(x: (screenSize.width * CGFloat((robot1Pos.value))) / CGFloat(2.9), y: robot1.center.y );

        robot2.center = CGPoint(x: (screenSize.width * CGFloat((robot2Pos.value))) / CGFloat(2.9), y: robot1.center.y );
        
        robot3.center = CGPoint(x: (screenSize.width * CGFloat((robot3Pos.value))) / CGFloat(2.9), y: robot1.center.y );


    }
    
    
    /**
     This function has all three UISlider connected so that it universally takes care of all robot position updates.
     */
    @IBAction func updatePosition(_ sender: Any) {
        robot1.center = Math.robotCenter(sliderValue: robot1Pos.value, currentCenter: robot1.center);
        robot2.center = Math.robotCenter(sliderValue: robot2Pos.value, currentCenter: robot2.center);
        robot3.center = Math.robotCenter(sliderValue: robot3Pos.value, currentCenter: robot3.center);

    }
    

    
    
    @IBAction func calculate(_ sender: Any) {
        var mass1 = Double(robot1Mass.text!)!;
        var mass2 = Double(robot2Mass.text!)!;
        var mass3 = Double(robot3Mass.text!)!;
        
        var d1 = Double(robot1Pos.value);
        var d2 = Double(robot2Pos.value);
        var d3 = Double(robot3Pos.value);
        totalMass = switchMass + mass1 + mass2 + mass3;
        
        
        theta = (atan(-((mass1*d1 + mass2*d2 + mass3+d3) / (((mass1+mass2+mass3) * height) + switchMass*switchCenterOfMass))))
        
        var delta = theta - 90.0;
        
        if delta.magnitude >= 8{
            results.text = "No";
        }else{
            results.text = "Yes";

        }
        
    }
    


}

