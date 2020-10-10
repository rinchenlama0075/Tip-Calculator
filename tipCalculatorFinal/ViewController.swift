//
//  ViewController.swift
//  tipCalculatorFinal
//
//  Created by Rinchen on 10/4/20.
//

import UIKit

//Formatting number for local currency

extension Formatter {
    static let number = NumberFormatter()
}
extension Locale {
    static let englishUS: Locale = .init(identifier: "en_US")
    static let frenchFR: Locale = .init(identifier: "fr_FR")
    static let portugueseBR: Locale = .init(identifier: "pt_BR")
    // ... and so on
}
extension Numeric {
    func formatted(with groupingSeparator: String? = nil, style: NumberFormatter.Style, locale: Locale = .current) -> String {
        Formatter.number.locale = locale
        Formatter.number.numberStyle = style
        if let groupingSeparator = groupingSeparator {
            Formatter.number.groupingSeparator = groupingSeparator
        }
        return Formatter.number.string(for: self) ?? ""
    }
    // Localized
    var currency:   String { formatted(style: .currency) }
    // Fixed locales
    var currencyUS: String { formatted(style: .currency, locale: .englishUS) }
    var currencyFR: String { formatted(style: .currency, locale: .frenchFR) }
    var currencyBR: String { formatted(style: .currency, locale: .portugueseBR) }
    // ... and so on
//    var calculator: String { formatted(groupingSeparator: style: .decimal) }
}

//end currency format funcitonality

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
        BillAmountLabel.becomeFirstResponder()
        // Do any additional setup after loading the view.
//        foodImage.image = UIImage(named: "background")
    }
    
    @IBAction func onTapOut(_ sender: Any) {
        view.endEditing(true);
    }
    
    @IBAction func BillAmountChange(_ sender: Any) {
        billAmount = Double(BillAmountLabel.text!) ?? 0
//        var suggestedTip = billAmount*0.18
        SuggestedTipLabel.text = String(format: "%.2f",(billAmount*0.18))
        TotalLabel.text = String(format: "%.2f", billAmount*0.18 + billAmount)
        CustomTipAmountLabel.text = String( format: "%.2f", (billAmount * Double(tipPercentages[SegmentedTipSelect.selectedSegmentIndex])/100).currencyUS ) }
    
    
    @IBAction func SegmentedTipValueChanged(_ sender: Any) {
        billAmount = Double(BillAmountLabel.text!) ?? 0
        CustomTipAmountLabel.text = String(format: "%.2f",billAmount * Double(tipPercentages[SegmentedTipSelect.selectedSegmentIndex])/100 )
        TotalLabel.text = String(format: "%.2f", (billAmount * Double(tipPercentages[SegmentedTipSelect.selectedSegmentIndex])/100 + billAmount).currencyUS)
        
    }
    
}

