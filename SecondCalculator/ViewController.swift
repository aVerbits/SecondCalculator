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
    var dotIsPlaced = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""

    
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
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlaced = false
    }
    
    func operrateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
        dotIsPlaced = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        dotIsPlaced = false
        
        switch operationSign {
        case "+":
            operrateWithTwoOperands{$0 + $1}
        case "-":
            operrateWithTwoOperands{$0 - $1}
        case "×":
            operrateWithTwoOperands{$0 * $1}
        case "÷":
            operrateWithTwoOperands{$0 / $1}

        default: break
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResaltLabel.text = "0"
        stillTyping = false
        dotIsPlaced = false
        operationSign = ""
    }
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    @IBAction func persentegButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        }else {
            secondOperand = firstOperand * currentInput / 100
        }
    }
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }
    @IBAction func dottButtonPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            displayResaltLabel.text = displayResaltLabel.text! + "."
            dotIsPlaced = true
        }else if !stillTyping && !dotIsPlaced {
            displayResaltLabel.text = "0."
        }
    }
    
    
    
}


