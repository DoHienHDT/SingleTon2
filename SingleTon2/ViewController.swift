//
//  ViewController.swift
//  SingleTon2
//
//  Created by dohien on 6/4/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if indexPath != nil {
            nameTextField.text = String(SingleTon.instance.numbers[indexPath.row])
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Button(_ sender: UIButton) {
        if indexPath != nil {
            SingleTon.instance.edit(at: indexPath.row, and: Int(nameTextField.text ?? "") ?? 0)
        } else {
            SingleTon.instance.addNew(number: Int(nameTextField.text!)!)
        }
         navigationController?.popViewController(animated: true)
    }
    
}

