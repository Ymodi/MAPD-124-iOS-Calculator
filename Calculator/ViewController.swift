//
//  ViewController.swift
//  Calculator
//
//  Created by Yesha Modi on 2017-01-11.
//  Copyright © 2017 Yesha Modi-300895482. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var display: UILabel!

    //remove 0 at the 1st 
    var middleOfTypingANumber = false

    @IBAction func appendDigit(_ sender: UIButton) {
    /*  Optionals concept
         What is the difference between ! and ?,
         which one we should use where?
    */
        let digit = sender.currentTitle!
        if middleOfTypingANumber {
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            middleOfTypingANumber = true
        }
        //print("digit = \(digit)")
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if middleOfTypingANumber{
            enter()
        }
        switch operation{
        case "×": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "-": performOperation { $1 - $0 }
//        case "√": performOperation { sqrt($0) }
            default: break
        }
    }
    
    func performOperation(operation:(Double, Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
//    func performOperation(operation: Double -> Double) {
//        if operandStack.count >= 1 {
//            displayValue = operation(operandStack.removeLast())
//            enter()
//        }
//    }
    
    var operandStack: Array<Double> = Array<Double>()
    
    @IBAction func enter() {
        middleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get{
            return NumberFormatter().number(from:display.text!)!.doubleValue
        }
        set{
            //Converting double to string using backslash parenthesis
            display.text = "\(newValue)"
            middleOfTypingANumber = false
        }
    }
    
}

