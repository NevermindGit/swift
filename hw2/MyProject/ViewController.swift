//
//  ViewController.swift
//  MyProject
//
//  Created by Вадим Валеев on 03.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.placeholder = "Enter your phone"

    }
    

    @IBAction func ButtonDidTap(_ sender: Any) {
                
        if (NSPredicate(format: "SELF MATCHES %@", "^89087\\d*")).evaluate(with: phoneTextField.text){
            guard let contactsList = storyboard?.instantiateViewController(withIdentifier: "ContactsListTableViewController") else { return }
            
            navigationController?.pushViewController(contactsList, animated: true)
            
            
        } else {
            
            guard let incorrectPhone = storyboard?.instantiateViewController(withIdentifier: "IncorrectPhoneViewController") else { return }
            
            present(incorrectPhone, animated: true)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        phoneTextField.text = nil
    }
    
}

