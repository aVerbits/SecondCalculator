//
//  ViewController.swift
//  SecondCalculator
//
//  Created by user on 10.10.2019.
//  Copyright © 2019 alekseiverbitski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayResaltLabel: UILabel!
    var stillTyping = false
    
    var firstOperand: Double = 0
    var currentInput: Double {
        get {
            return Double(displayResaltLabel.text!)!
        }
        set {
            displayResaltLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        
        if stillTyping {
            if (displayResaltLabel.text?.characters.count)! < 20 {
                displayResaltLabel.text = displayResaltLabel.text! + number
            }
        }else {
            displayResaltLabel.text = number
            stillTyping = true
        }
      }
    @IBAction func twoOperandSignPressed(_ sender: UIButton) {
        
        firstOperand = currentInput
        print(firstOperand)
        stillTyping = false
        
    }
    
    }


