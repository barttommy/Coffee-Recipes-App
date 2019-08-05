//
//  NewRecipeViewController.swift
//  Bart, Thomas - Final Project
//
//  Created by Thomas Bart on 3/14/19.
//  Copyright © 2019 Thomas Bart. All rights reserved.
//

import UIKit

var recipe : String = ""
var name   : String = ""
var author : String = ""
var weight : Int = 20
var water  : Int = 500
var temp   : Int = 205

class NewRecipeViewController: UIViewController {

    @IBOutlet weak var methodSelection: UISegmentedControl!
    @IBOutlet weak var coffeeWeight: UIStepper!
    @IBOutlet weak var coffeeWeightLabel: UILabel!
    @IBOutlet weak var waterWeight: UIStepper!
    @IBOutlet weak var waterWeightLabel: UILabel!
    @IBOutlet weak var temperature: UIStepper!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if Preferences["scale"]  == "standard" {
            coffeeWeightLabel.text = String(format: "%.2f",convertToOunces(Double(weight))) + "oz"
            waterWeightLabel.text = String(format: "%.2f",convertToOunces(Double(water))) + "oz"
        }
        else {
            coffeeWeightLabel.text = String (weight) + "g"
            waterWeightLabel.text = String (water) + "g"
        }
        
        if Preferences["degree"]  == "celsius" {
            temperatureLabel.text = String(convertToCelsius(temp)) + "°C"
        }
        else {
            temperatureLabel.text = String (temp) + "°F"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func inputName(_ sender: UIButton) {
        textInputAlert(title: "New Name", message: "Enter new name", isName: true)
    }
    
    
    @IBAction func inputAuthor(_ sender: UIButton) {
        textInputAlert(title: "New Author", message: "Enter new author", isName: false)
    }
    
    
    @IBAction func saveNewRecipe(_ sender: UIButton) {
        let index = methodSelection.selectedSegmentIndex
        
        if index == 0 {
            if aero_data.index(where: { $0.name == name}) != nil {
                recipeErrorAlert()
            }
            else {
                aero_data.append (AeroPress (name: name, type: .classic, weight: String(weight), water: String(water), temp: String(temp), author: author, recipe: recipe, favorite: false))
                recipeSavedAlert()
            }
        }
        
        else if index == 1 {
            if aero_data.index(where: { $0.name == name}) != nil {
                recipeErrorAlert()
            }
            else {
                aero_data.append (AeroPress (name: name, type: .classic, weight: String(weight), water: String(water), temp: String(temp), author: author, recipe: recipe, favorite: false))
                recipeSavedAlert()
            }
        }
        
        else if index == 2 {
            if chemex_data.index(where: { $0.name == name}) != nil {
                recipeErrorAlert()
            }
            else {
                chemex_data.append (Chemex (name: name, type: .chemex, weight: String(weight), water: String(water), temp: String(temp), author: author, recipe: recipe, favorite: false))
                recipeSavedAlert()
            }
        }
        
        else if index == 3 {
            if hario_data.index(where: { $0.name == name}) != nil {
                recipeErrorAlert()
            }
            else {
                hario_data.append (Hario (name: name, type: .hario, weight: String(weight), water: String(water), temp: String(temp), author: author, recipe: recipe, favorite: false))
                recipeSavedAlert()
            }
        }
        
        else if index == 4 {
            if french_data.index(where: { $0.name == name}) != nil {
                recipeErrorAlert()
            }
            else {
                french_data.append (French (name: name, type: .french, weight: String(weight), water: String(water), temp: String(temp), author: author, recipe: recipe, favorite: false))
                recipeSavedAlert()
            }
        }
        restoreDefaults()
    }
    
    @IBAction func discardChanges(_ sender: UIButton) {
        let menu = UIAlertController(title: nil, message: "Lose unsaved changes?", preferredStyle: .actionSheet)
        let discardAction = UIAlertAction(title: "Discard Recipe", style: .destructive) {
            (action) in self.restoreDefaults() }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        menu.addAction(discardAction)
        menu.addAction(cancelAction)
        present(menu, animated: true, completion: nil)
    }
    
    @IBAction func coffeeChanged(_ sender: UIStepper) {
        weight = Int (sender.value)
        if Preferences["scale"]  == "standard" {
            coffeeWeightLabel.text = String(format: "%.2f", convertToOunces(sender.value)) + "oz"
        }
        else {
            coffeeWeightLabel.text = String(weight) + "g"
        }
    }
    
    @IBAction func waterChanged(_ sender: UIStepper) {
        water = Int (sender.value)
        if Preferences["scale"]  == "standard" {
            waterWeightLabel.text = String(format: "%.2f", convertToOunces(sender.value)) + "oz"
        }
        else {
            waterWeightLabel.text = String(water) + "g"
        }
    }
    
    @IBAction func tempChanged(_ sender: UIStepper) {
        temp = Int (sender.value)
        if Preferences["degree"]  == "celsius" {
            temperatureLabel.text = String(convertToCelsius(temp)) + "°C"
        }
        else {
            temperatureLabel.text = String(temp) + "°F"
        }
    }
    
    func convertToCelsius (_ value : Int) -> Int {
        return Int((Double((value-32))*(5/9)))
    }
    
    func convertToOunces (_ value : Double) -> Double {
        return value / 28.35
    }
    
    func recipeSavedAlert() {
        let title   = "Enjoy!"
        let message = "Recipe saved"
        let alertController = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func recipeErrorAlert() {
        let title   = "Name Error"
        let message = "Duplicate recipe names not allowed within brew methods"
        let alertController = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func textInputAlert (title t : String, message msg : String, isName type : Bool) {
        
        let alert = UIAlertController(title: t, message: msg, preferredStyle: .alert)
        alert.addTextField(configurationHandler: {(textField) in
            textField.placeholder = "Enter text:"
        })
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak alert] (_) in
            let text = (alert?.textFields![0].text)!
            if type {
                name = text;
                self.nameLabel.text = text;
            }
            else {
                author = text
                self.authorLabel.text = text
            }
        }))
        self.present(alert, animated: true, completion: nil )
    }
    
    func restoreDefaults () {
        name = ""
        author = ""
        recipe = ""
        weight = 20
        water = 500
        temp = 205
        nameLabel.text = "Name"
        authorLabel.text = "Author"
        
        if Preferences["scale"]  == "standard" {
            coffeeWeightLabel.text = "0.71oz"
            waterWeightLabel.text  = "19.4oz"
        }
        else {
            coffeeWeightLabel.text = "20g"
            waterWeightLabel.text  = "500g"
        }
        
        if Preferences["degree"]  == "celsius" {
            temperatureLabel.text  = "96°C"
        }
        else {
            temperatureLabel.text  = "205°F"
        }
        
        coffeeWeight.value = 20
        waterWeight.value  = 500
        temperature.value  = 205
        methodSelection.selectedSegmentIndex = 0
    }
}
