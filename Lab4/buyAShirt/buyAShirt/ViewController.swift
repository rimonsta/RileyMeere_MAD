//
//  ViewController.swift
//  buyAShirt
//
//  Created by Riley Meere on 9/29/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchItem()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var itemNumber: UITextField!
    @IBOutlet weak var shirtCount: UILabel!
    @IBOutlet weak var shirtStepper: UIStepper!
    @IBOutlet weak var priceTotal: UILabel!
    @IBOutlet weak var tshirtView: UIStackView!
    
    @IBAction func buyShirt(_ sender: UIStepper) {
        if shirtStepper.value == 0 {
            shirtCount.text = "0"
        }
        else {
            shirtCount.text = String(format: "%.0f", shirtStepper.value)
        }
        
        updatePriceTotal()
    }
    
    func updatePriceTotal() {
        let numShirts = shirtStepper.value
        let total = numShirts*10
        let currencyFormatter = NumberFormatter()
        
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        priceTotal.text = currencyFormatter.string(from: NSNumber(value: total))
    }
    
    func searchItem() {
        
        if itemNumber.text!.isEmpty {
            // no highlight
        }
        else {
            let itemSearch: Int? = Int(itemNumber.text!)
            
            if itemSearch == 74478 {
                // highlight view (tshirtView)
                tshirtView.backgroundColor = .yellow
            }
            // add more if statements when implementing other items
            else {
                let alert = UIAlertController(title: "Error", message: "This item does not exist", preferredStyle: UIAlertController.Style.alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in self.shirtStepper.value = 0
                    self.shirtCount.text = "0"
                    self.updatePriceTotal()
                })
                alert.addAction(cancelAction)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
}

