//
//  DetailViewController.swift
//  Table view
//
//  Created by Rahimi, Kevin on 20/10/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var name:String?
    var room:String?
    var email:String?

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var roomLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!

    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        roomLabel.text = room
        emailLabel.text = email
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
