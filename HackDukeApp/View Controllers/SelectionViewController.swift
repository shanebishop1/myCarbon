//
//  SelectionViewController.swift
//  HackDukeApp
//
//  Created by Andy Kotz on 12/5/20.
//

import UIKit

class SelectionViewController: UIViewController {
    
    @IBAction func houseHoldPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToHousehold" , sender: self)
    }
}
