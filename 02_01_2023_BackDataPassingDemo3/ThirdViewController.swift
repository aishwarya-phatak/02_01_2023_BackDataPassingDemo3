//
//  ThirdViewController.swift
//  02_01_2023_BackDataPassingDemo3
//
//  Created by Vishal Jagtap on 31/01/23.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    
    var students : [Student] = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentTableView.dataSource = self
        studentTableView.delegate = self
    }
    @IBOutlet weak var moveToSVC: UIBarButtonItem!
}

extension ThirdViewController : StudentInfoPassingProtocol{
    func backDataPassing(student: Student) {
        
        students.append(student)
        studentTableView.reloadData()
    }
}

//MARK :
extension ThirdViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as? StudentTableViewCell
        
        var eachObjectOfStudent = students[indexPath.row]
        
        studentTableViewCell?.firstNameLabel.text = eachObjectOfStudent.firstName
        studentTableViewCell?.lastNameLabel.text = eachObjectOfStudent.lastName
        studentTableViewCell?.rollNumberLabel.text = String(eachObjectOfStudent.rollNumber)
        
        return studentTableViewCell ?? UITableViewCell()
    }
}

extension ThirdViewController : UITableViewDelegate{
    
}

