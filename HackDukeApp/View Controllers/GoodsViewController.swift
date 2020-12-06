//
//  GoodsViewController.swift
//  HackDukeApp
//
//  Created by Andy Kotz on 12/5/20.
//

import UIKit
class GoodsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickedFood: String = ""
    @IBOutlet weak var picker: UIPickerView!
    var pickerData = ["Choose one of the following", "Plastic Bottle","Soap/Shampoo","T-Shirt","Jeans", "Rain Jacket","Running Shoes"]
    var dicPick = ["Empty":0, "Plastic Bottle":4.5,"Soap/Shampoo":0.007,"T-Shirt":19.14,"Jeans":73.48, "Rain Jacket":39.6,"Running Shoes":30.8]
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
    }
    
    @IBOutlet weak var unitInput: UITextField!
    
    @IBAction func leaveGoods(_ sender: UIButton) {
        Total.subTotal = Float(dicPick[pickedFood]!)*Float(unitInput.text!)!
        self.performSegue(withIdentifier: "goodsToSelector", sender: self)
    }
//    @IBAction func getOut(_ sender: UIButton) {
//        Total.subTotal = Float(dicPick[pickedFood]!)*Float(unitInput.text!)!;
//        self.performSegue(withIdentifier: "goodsToSelector" , sender: self)
//    }
}

