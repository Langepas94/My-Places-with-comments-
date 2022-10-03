//
//  NewPlaceTableViewController.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 03.10.2022.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }else {
            view.endEditing(true)
        }
    }
}

extension NewPlaceTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
