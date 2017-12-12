//
//  ViewController.swift
//  testing_demo
//
//  Created by jowkame on 10/2/17.
//  Copyright © 2017 jowkame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    @IBAction func redButtonDidTap(_ sender: Any) {
        colorView.backgroundColor = UIColor.red
    }
    
    @IBAction func greenButtonDidTap(_ sender: Any) {
        colorView.backgroundColor = UIColor.green
    }
    
    @IBAction func blueButtonDidTap(_ sender: Any) {
        colorView.backgroundColor = UIColor.blue
    }
}

