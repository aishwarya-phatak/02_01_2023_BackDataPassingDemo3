//
//  SecondViewController.swift
//  02_01_2023_BackDataPassingDemo3
//
//  Created by Vishal Jagtap on 30/01/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var rollNumberTextField: UITextField!
    
    var firstName : String = ""
    var lastName : String = ""
    var rollNumber : Int = 0
    var studentObject : Student?
    
    //approach 2
    var studentBackDataPassingDelegate : StudentInfoPassingProtocol?
    
   // var studentBackDataPassingdelegate : StudentInformationPassingProtocol?
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
    }
   
    @IBAction func btnNavigateToFirstViewController(_ sender: Any) {
        //Approach 2
        guard let studentDataPassDelegate = studentBackDataPassingDelegate else { return  }
        
        firstName = firstNameTextField.text!
        lastName = lastNameTextField.text!
        rollNumber = (rollNumberTextField.text?.codingKey.intValue)!
        
        studentObject = Student(firstName: firstName, lastName: lastName, rollNumber: rollNumber)
        
        studentDataPassDelegate.backDataPassing(student: studentObject!)
        
        navigationController?.popViewController(animated: true)
        
        //Approach 1
        /*guard let delegateSVC = studentBackDataPassingdelegate else { return
        }
        
        firstName = firstNameTextField.text!
        lastName = lastNameTextField.text!
        rollNumber = (rollNumberTextField.text?.codingKey.intValue)!
        
        delegateSVC.passDataToSVC(firstName: firstName, lastName: lastName, rollNumber: rollNumber)
        
        navigationController?.popViewController(animated: true)
        */
    }
}
