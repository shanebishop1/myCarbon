//
//  TransportationViewController.swift
//  HackDukeApp
//
//  Created by Andy Kotz on 12/5/20.
//
import UIKit
class TransportationViewController: UIViewController{
    
    
    @IBOutlet weak var unitOutput: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var userOutputCarMPG: UILabel!
    
    var units: String = ""
    var unitsforCar: String = ""
    var inputMilesDriven: String = ""
    var milesDriven: Double = 0
    var inputConversion: String = ""
    var unitpermile: Double = 0
    
    var subtotal: Double = 0

    
    @IBAction func carPressed(_ sender: UIButton) {
        milesDriven = Double(userInput.text ?? "0")!
        unitpermile = Double(userInput.text ?? "0")!
//        unitpermile = Double(inputConversion) ?? 0
        units = "miles"
        unitOutput.text = units
        unitsforCar = "mpg"
        userOutputCarMPG.text = unitsforCar
        subtotal = milesDriven * unitpermile
    }
    @IBAction func busPressed(_ sender: UIButton) {
        milesDriven = Double(userInput.text ?? "0")!
        unitpermile = 0.36 // pounds per mile
        units = "miles"
        unitOutput.text = units
        subtotal = milesDriven * unitpermile
    }
    
    @IBAction func trainPressed(_ sender: UIButton) {
        milesDriven = Double(userInput.text ?? "0")!
        unitpermile = 0.0807 // avg of long distance, commuter, subway
        units = "miles"
        unitOutput.text = units
        subtotal = milesDriven * unitpermile
    }
    
    @IBAction func planePressed(_ sender: UIButton) {
        milesDriven = Double(userInput.text ?? "0")!
        unitpermile = 0.176
        units = "miles"
        unitOutput.text = units
        subtotal = milesDriven * unitpermile
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        Total.subTotal = Float(subtotal)
        self.performSegue(withIdentifier: "TranspotoSelector", sender: self)
    }
}
