//
//  ViewController.swift
//  Research Papers
//
//  Created by Kevon Rahimi on 24/11/2022.
//

import UIKit

class ViewController: UIViewController {
    var titleOfPaper: String?
    var year: String?
    var authors: String?
    var email: String?
    var abstract: String?
    var URL: URL?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var abstractLabel: UILabel!
    
    @IBOutlet weak var urlTextView: UITextView!
    
    @IBOutlet weak var emailTitle: UILabel!
    
    @IBOutlet weak var abstractTitle: UILabel!
    @IBOutlet weak var urlTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleOfPaper
        yearLabel.text = year
        authorLabel.text = authors
        if (email==nil){
            emailTitle.text = ""
            emailLabel.text = ""
        }
        else {
            emailLabel.text = email
        }
        if (abstract==nil){
            abstractTitle.text = ""
            abstractLabel.text = ""
        }
        else{
            abstractLabel.text = abstract
        }
        if (URL==nil){
            urlTextView.text = ""
            urlTitle.text = ""
        }else{
            let attributedString = NSMutableAttributedString(string: URL!.absoluteString)
            attributedString.addAttribute(.link, value: URL!.absoluteString, range: NSRange(location: 0, length: URL!.absoluteString.count))
            
            urlTextView.attributedText = attributedString
        }
    }

}

