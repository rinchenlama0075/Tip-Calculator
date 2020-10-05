//
//  ViewController.swift
//  tipCalculatorFinal
//
//  Created by Rinchen on 10/4/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var SuggestedTipLabel: UILabel!
    @IBOutlet weak var BillAmountLabel: UITextField!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var SegmentedTipSelect: UISegmentedControl!
    @IBOutlet weak var CustomTipAmountLabel: UILabel!
    var billAmount = 0.00;
    var tipPercentages = [10, 20, 30];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        foodImage.image = UIImage(named: "background")
    }
    
    @IBAction func onTapOut(_ sender: Any) {
        view.endEditing(true);
    }
    
    @IBAction func BillAmountChange(_ sender: Any) {
        billAmount = Double(BillAmountLabel.text!) ?? 0
//        var suggestedTip = billAmount*0.18
        SuggestedTipLabel.text = String(format: "$%.2f",billAmount*0.18)
        TotalLabel.text = String(format: "$%.2f", billAmount*0.18 + billAmount)
        CustomTipAmountLabel.text = String( format: "$%.2f", billAmount * Double(tipPercentages[SegmentedTipSelect.selectedSegmentIndex])/100 ) }
    
    
    @IBAction func SegmentedTipValueChanged(_ sender: Any) {
        billAmount = Double(BillAmountLabel.text!) ?? 0
        CustomTipAmountLabel.text = String(format: "$%.2f",billAmount * Double(tipPercentages[SegmentedTipSelect.selectedSegmentIndex])/100 )
        TotalLabel.text = String(format: "$%.2f", billAmount * Double(tipPercentages[SegmentedTipSelect.selectedSegmentIndex])/100 + billAmount)
        
    }
    
}

