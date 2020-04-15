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
    
    
    let switchMass = 93.0; //lb
    var totalMass = 0.0;
    var theta = 0.0; //degree
    var height = 1.228725; //meters
    var switchCenterOfMass = 1.45; //meters from the left
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updatePosition1(_ sender: UISlider) {
        
        robot1.center = CGPoint(x: robot1.center.x + CGFloat(sender.value), y: robot1.center.y );
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

