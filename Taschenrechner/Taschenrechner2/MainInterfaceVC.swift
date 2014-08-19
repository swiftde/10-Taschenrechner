//
//  MainInterfaceVC.swift
//  Taschenrechner2
//
//  Created by Benjamin Herzog on 29.06.14.
//  Copyright (c) 2014 Benjamin Herzog. All rights reserved.
//

import UIKit

class MainInterfaceVC: UIViewController,  UITextFieldDelegate {

    @IBOutlet var zahl1TF: UITextField!
    @IBOutlet var zahl2TF: UITextField!
    @IBOutlet var operatorSC: UISegmentedControl!
    
    @IBOutlet var ergebnisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zahl1TF.delegate = self
        zahl2TF.delegate = self
    }
    
    func textField(textField: UITextField!, shouldChangeCharactersInRange range: NSRange, replacementString string: String!) -> Bool {
        //textField.text = textField.text.bridgeToObjectiveC().stringByReplacingCharactersInRange(range, withString: string)
        textField.text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        refreshUIElements()
        
        return false
    }
    
    @IBAction func operatorChanged() {
        refreshUIElements()
    }
    
    func refreshUIElements() {
        if zahl1TF.text.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) == 0 ||
            zahl2TF.text.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) == 0 {
                ergebnisLabel?.text = "Bitte geben Sie beide Zahlen an!"
                return
        }
        let zahl1 = NSString(string:zahl1TF.text).doubleValue
        let zahl2 = NSString(string:zahl2TF.text).doubleValue
        
        switch operatorSC.selectedSegmentIndex {
        case 0: ergebnisLabel.text = "Ergebnis: \(zahl1 + zahl2)"
        case 1: ergebnisLabel.text = "Ergebnis: \(zahl1 - zahl2)"
        case 2: ergebnisLabel.text = "Ergebnis: \(zahl1 * zahl2)"
        case 3: ergebnisLabel.text = "Ergebnis: \(zahl1 / zahl2)"
        default: ergebnisLabel.text = "Fehler!"
        }
    }
}
