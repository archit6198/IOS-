//
//  ViewController.swift
//  assignment1
//
//  Created by Archit Sehgal on 2024-09-29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var inputHeightInCentimeters: UITextField!
    
    @IBOutlet weak var inputHeightInInches: UITextField!
    
    @IBOutlet weak var inputHeightInFeet: UITextField!
    
    @IBOutlet weak var inputWeight: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
  
    @IBOutlet weak var refreshButton: UIButton!
    
    
    @IBOutlet weak var BMI: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchAction(_ sender: Any) {
        if mySwitch.isOn {
            inputHeightInFeet.isHidden = true
            inputHeightInInches.isHidden = true
            inputHeightInCentimeters.isHidden = false
            inputWeight.placeholder = "kgs"
            switchLabel.text = "Switch to Standard"
        } else {
            inputHeightInFeet.isHidden = false
            inputHeightInInches.isHidden = false
            inputHeightInCentimeters.isHidden = true
            inputWeight.placeholder = "pounds"
            switchLabel.text = "Switch to Metrics"
        }
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        if mySwitch.isOn {
                    if let height = inputHeightInCentimeters.text, let weight = inputWeight.text {
                        if !height.isEmpty && !weight.isEmpty {
                            if let numHeight = Double(height), let numWeight = Double(weight) {
                                let heightInMeters = numHeight / 100
                                let bmi = numWeight / (heightInMeters * heightInMeters)
                                BMI.text = String(format: "%.2f", bmi)
                                
                                if bmi <= 18.5 {
                                    categoryLabel.text = "Underweight"
                                } else if bmi > 18.5 && bmi < 24.9 {
                                    categoryLabel.text = "Normal Weight"
                                } else if bmi >= 25 && bmi < 29.9 {
                                    categoryLabel.text = "Overweight"
                                } else {
                                    categoryLabel.text = "Obese"
                                }
                            } else {
                                showAlert(message: "Please enter valid numerical values for height and weight.")
                            }
                        } else {
                            showAlert(message: "Please fill in both height and weight.")
                        }
                    }
                } else {
                    if let heightInFeet = inputHeightInFeet.text, let heightInInches = inputHeightInInches.text, let weight = inputWeight.text {
                        if !heightInFeet.isEmpty && !heightInInches.isEmpty && !weight.isEmpty {
                            if let numHeightInFeet = Double(heightInFeet), let numHeightInInches = Double(heightInInches), let numWeight = Double(weight) {
                                let totalHeightInInches = (numHeightInFeet * 12) + numHeightInInches
                                let bmi = (numWeight / (totalHeightInInches * totalHeightInInches)) * 703
                                BMI.text = String(format: "%.2f",bmi)
                                
                                if bmi <= 18.5 {
                                    categoryLabel.text = "Underweight"
                                } else if bmi > 18.5 && bmi < 24.9 {
                                    categoryLabel.text = "Normal Weight"
                                } else if bmi >= 25 && bmi < 29.9 {
                                    categoryLabel.text = "Overweight"
                                } else {
                                    categoryLabel.text = "Obese"
                                }
                            } else {
                                showAlert(message: "Please enter valid numerical values for height and weight.")
                            }
                        } else {
                            showAlert(message: "Please fill in all height and weight fields.")
                        }
                    }
                }
            }
            
                    
                    func showAlert(message: String) {
                        let alert = UIAlertController(title: "Input Error", message: message, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        present(alert, animated: true, completion: nil)
                    }
                }
