//
//  ViewController.swift
//  02_01_2023_BackDataPassingDemo3
//
//  Created by Vishal Jagtap on 30/01/23.
//

import UIKit

class ViewController: UIViewController,StudentInformationPassingProtocol{
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var rollNumberLabel: UILabel!
    
    var secondViewController : SecondViewController = SecondViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func btnMoveToSVC(_ sender: Any) {
        
        secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController?)!!
        //secondViewController.studentBackDataPassingdelegate = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func passDataToSVC(firstName: String, lastName: String, rollNumber: Int) {
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
        rollNumberLabel.text = String(rollNumber)
    }
}
