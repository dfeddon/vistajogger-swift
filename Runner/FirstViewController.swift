//
//  FirstViewController.swift
//  Runner
//
//  Created by Ben Willems on 4/9/15.
//  Copyright (c) 2015 Ben Willems. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIPickerViewDelegate {

    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myLabel: UILabel!
    let pickerData = ["Your mom's house","The Grand Canyon","Disney Marathon","Immersyve is queer","The fucking moon!","The Swiss-fucking-Alps!","Your bathroom","Boston Marathon","Planet Moon Endor","Up the Sears Tower", "Route 66", "Seven inches from here"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        return pickerData[row]
    }


}

