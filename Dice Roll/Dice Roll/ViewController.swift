//
//  ViewController.swift
//  Dice Roll
//
//  Created by Rahimi, Kevin on 06/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceInput: UITextField!
    
    @IBOutlet weak var diceOutput: UILabel!
    
    @IBAction func okButton(_ sender: Any) {
        diceInput.becomeFirstResponder()

        let guess = diceInput.text!
        diceInput.text = ""
        let randNum = String(Int.random(in: 2..<13))
        let answer:String
        if (guess == randNum)
            {
            answer = ". You are correct!"
            }
        else {
            answer = ". You are incorrect!"
             }
        
        diceOutput.text = "The number you chose was: " + guess + ", The number rolled was: " + randNum + answer
        diceInput.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

