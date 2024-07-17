//
//  ViewController.swift
//  Times Table App
//
//  Created by Rahimi, Kevin on 13/10/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    var userAnswer = ""
    var userTable = [1,2,3,4,5,6,6,7,7,8,8,9,30]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var inputNumber: UITextField!
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters) == nil
    }
    
    @IBAction func goButton(_ sender: Any) {
        userAnswer = inputNumber.text!
        myTable.reloadData()
        inputNumber.resignFirstResponder()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (inputNumber.text == ""){
            myTable.isHidden = true
        }
        else{
            myTable.isHidden = false
        }
            let aCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            if indexPath.section == 0 {
                let answer = (Float(userAnswer) ?? 0) * Float(indexPath.row+1)
                var content = UIListContentConfiguration.cell()
                content.text = String(indexPath.row+1) + " x " + String(userAnswer) + " = \(answer)"
                aCell.contentConfiguration = content
            }
            if indexPath.section == 1 {//&& indexPath.row != 0 {
                let answer2 = (Float(userAnswer) ?? 1) / Float(indexPath.row+1)
                var content = UIListContentConfiguration.cell()
                content.text = String(userAnswer) + " / " + String(indexPath.row+1) + " = \(answer2)"
                aCell.contentConfiguration = content
            }
            return aCell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "Multiplication"
        }
        else{
            return "Division"
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputNumber.delegate = self
    }


}

