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
    @IBOutlet weak var degResult: UILabel!
    
    @IBOutlet weak var robot1: UIImageView!
    @IBOutlet weak var robot2: UIImageView!
    @IBOutlet weak var robot3: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //initialize position for three ImageView objects.
        robot1.center = Math.robotCenter(sliderValue: robot1Pos.value, currentCenter: robot1.center);
        robot2.center = Math.robotCenter(sliderValue: robot2Pos.value, currentCenter: robot2.center);
        robot3.center = Math.robotCenter(sliderValue: robot3Pos.value, currentCenter: robot3.center);

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
        let mass1 = Double(robot1Mass.text!)!;
        let mass2 = Double(robot2Mass.text!)!;
        let mass3 = Double(robot3Mass.text!)!;
        
        let d1 = Double(robot1Pos.value);
        let d2 = Double(robot2Pos.value);
        let d3 = Double(robot3Pos.value);
        
        
//        theta = (atan(-((mass1*d1 + mass2*d2 + mass3+d3) / (((mass1+mass2+mass3) * height) + switchMass*switchCenterOfMass))))
        let theta = Math.findTheta(m1: mass1, m2: mass2, m3: mass3, d1: d1, d2: d2, d3: d3)
        
        
        if theta.magnitude >= 8{
            results.text = "No";
        }else{
            results.text = "Yes";

        }
        
        
        degResult.text = String(format:"%f", theta);
        
    }
    


}

