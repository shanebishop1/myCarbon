//
//  FoodsViewController.swift
//  HackDukeApp
//
//  Created by Andy Kotz on 12/5/20.
//

import UIKit
class FoodsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickedFood: String = ""
    @IBOutlet weak var picker: UIPickerView!
    var pickerData = ["Choose one of the following", "Beef", "Lamb", "Cheese", "Chocolate","Coffee","Pork","Poultry","Farmed Fish","Fresh Fish","Eggs","Milk","Wheat","Sugar","Fruits & Vegetables"]
    var dicPick = ["Empty":0, "Beef":60, "Lamb":24, "Cheese":21, "Chocolate":19,"Coffee":17,"Pork":7,"Poultry":6,"Farmed Fish":5,"Fresh Fish":3,"Eggs":4.5,"Milk":3,"Wheat":1.5,"Sugar":3,"Fruits & Vegetables":0.5]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sideView = UIPickerView()
        sideView.frame = self.view.frame
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        // Input the data into the array

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedFood = pickerData[row]
//        print(row)
    }
    
    @IBOutlet weak var unitInput: UITextField!
    
    @IBAction func getOut(_ sender: UIButton) {
//        print(dicPick[pickedFood]!)
        Total.subTotal = Float(dicPick[pickedFood]!)*Float(unitInput.text!)!
        self.performSegue(withIdentifier: "foodToSelector" , sender: self)
    }
}
