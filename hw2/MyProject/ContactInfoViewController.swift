//
//  ContactInfoViewController.swift
//  MyProject
//
//  Created by Вадим Валеев on 03.07.2022.
//

import UIKit

class ContactInfoViewController: UIViewController {
    
    var item: Contact?
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var phoneContactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneContactLabel.text = item?.phoneNumber
        contactNameLabel.text = item?.name
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
