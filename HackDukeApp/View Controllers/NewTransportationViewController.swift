//
//  NewTransportationViewController.swift
//  HackDukeApp
//
//  Created by Niam Kothari on 12/5/20.
//

import UIKit

class NewTransportationViewController: UIViewController {
    
    @IBOutlet weak var unitOutput: UILabel!
    @IBOutlet weak var userInput: UITextField!
    
    @IBOutlet weak var userOutputCarMPG: UILabel!
    @IBOutlet weak var userInputCarMPG: UITextField!
    
    @IBOutlet weak var busButton: UIButton!
    @IBOutlet weak var planeButton: UIButton!
    @IBOutlet weak var carButton: UIButton!
    @IBOutlet weak var trainButton: UIButton!
    
    
    var units: String = ""
    var unitsforCar: String = ""
    var inputMilesDriven: String = ""
    var milesDriven: Double = 0
    var inputConversion: String = ""
    var unitpermile: Double = 0
    
    var subtotal: Double = 0

    var car: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        busButton.layer.borderWidth = 1.5
        busButton.layer.borderColor = UIColor.white.cgColor
        busButton.layer.cornerRadius = busButton.bounds.width / 8
        
        carButton.layer.borderWidth = 1.5
        carButton.layer.borderColor = UIColor.white.cgColor
        carButton.layer.cornerRadius = busButton.bounds.width / 8
        
        trainButton.layer.borderWidth = 1.5
        trainButton.layer.borderColor = UIColor.white.cgColor
        trainButton.layer.cornerRadius = busButton.bounds.width / 8
        
        planeButton.layer.borderWidth = 1.5
        planeButton.layer.borderColor = UIColor.white.cgColor
        planeButton.layer.cornerRadius = busButton.bounds.width / 8
    }
    
    @IBAction func carPressed(_ sender: UIButton) {
//        milesDriven = Double(userInput.text ?? "0") ?? 0
//        unitpermile = Double(userInput.text ?? "0") ?? 0
//        unitpermile = Double(inputConversion) ?? 0
        units = "miles"
        unitOutput.text = units
        unitsforCar = "mpg"
        userOutputCarMPG.text = unitsforCar
//        subtotal = milesDriven * unitpermile
        car = 1
    }
    @IBAction func busPressed(_ sender: UIButton) {
//        milesDriven = Double(userInput.text ?? "0")!
        unitpermile = 0.36 // pounds per mile
        units = "miles"
        unitOutput.text = units
//        subtotal = milesDriven * unitpermile
    }
    
    @IBAction func trainPressed(_ sender: UIButton) {
//        milesDriven = Double(userInput.text ?? "0")!
        unitpermile = 0.0807 // avg of long distance, commuter, subway
        units = "miles"
        unitOutput.text = units
//        subtotal = milesDriven * unitpermile
    }
    
    @IBAction func planePressed(_ sender: UIButton) {
//        milesDriven = Double(userInput.text ?? "0")!
        unitpermile = 0.176
        units = "miles"
        unitOutput.text = units
//        subtotal = milesDriven * unitpermile
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        if car == 1 {
            subtotal = Double(userInput.text!)! / Double(userInputCarMPG.text!)! * 6.7
            Total.subTotal = Float(subtotal)
            self.performSegue(withIdentifier: "TranspotoSelector", sender: self)
        }
        else {
            subtotal = unitpermile * Double(userInput.text!)!
            Total.subTotal = Float(subtotal)
            self.performSegue(withIdentifier: "TranspotoSelector", sender: self)
        }
    }
}
