//
//  DetailViewController.swift
//  Bart, Thomas - Final Project
//
//  Created by Thomas Bart on 3/13/19.
//  Copyright © 2019 Thomas Bart. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var aeroRecipe   : AeroPress?
    var chemRecipe   : Chemex?
    var harioRecipe  : Hario?
    var frenchRecipe : French?
    var favoriteRecipe : Favorites?
    
    var favorite : Bool = false
    var author : String = ""
    var method : String = ""
    
    var weight : String = ""
    var water  : String = ""
    var temp   : String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        if let r = aeroRecipe {
            titleLabel.text = r.name
            method = r.type.rawValue
            descriptionLabel.text = r.recipe
            weight = r.weight
            water = r.water
            temp = r.temp
            author = r.author
            favorite = r.favorite
        }
        
        else if let r = chemRecipe {
            titleLabel.text = r.name
            method = r.type.rawValue
            descriptionLabel.text = r.recipe
            weight = r.weight
            water = r.water
            temp = r.temp
            author = r.author
            favorite = r.favorite
        }
        
        else if let r = harioRecipe {
            titleLabel.text = r.name
            method = r.type.rawValue
            descriptionLabel.text = r.recipe
            weight = r.weight
            water = r.water
            temp = r.temp
            author = r.author
            favorite = r.favorite
        }
        
        else if let r = frenchRecipe {
            titleLabel.text = r.name
            method = r.type.rawValue
            descriptionLabel.text = r.recipe
            weight = r.weight
            water = r.water
            temp = r.temp
            author = r.author
            favorite = r.favorite
        }
        else if let r = favoriteRecipe {
            titleLabel.text = r.name
            method = r.type.rawValue
            descriptionLabel.text = r.recipe
            weight = r.weight
            water = r.water
            temp = r.temp
            author = r.author
            favorite = r.favorite
        }
        
        setLabels()
        setHeartImage()
    } 
    
    @IBAction func favoritePressed(_ sender: UIButton) {
        if favorite {
            if let index = favorite_data.index(where: { $0.name == titleLabel.text && $0.type.rawValue == method }) {
                favorite_data.remove(at: index)
            }
            favorite = false
        }
            
        else {
            favorite = true
            favorite_data.append(getData())
        }
        setFavorite()
        setHeartImage()
    }
    
    func getData () -> Favorites {
        return Favorites (  name     : titleLabel.text ?? "",
                            type     : Type(rawValue: method)!,
                            weight   : weight,
                            water    : water,
                            temp     : temp,
                            author   : author,
                            recipe   : descriptionLabel.text ?? "",
                            favorite : favorite)
    }
    
    func setFavorite () {
        if let r = aeroRecipe { r.favorite = favorite }
        else if let r = chemRecipe { r.favorite = favorite }
        else if let r = harioRecipe { r.favorite = favorite }
        else if let r = frenchRecipe { r.favorite = favorite }
        else if let r = favoriteRecipe {
            r.favorite = favorite
            let type = r.type.rawValue
            if type == "classic" ||  type == "inverted" {
                if let index = aero_data.index(where: {$0.name == r.name && $0.type.rawValue == type}) {
                    aero_data[index].favorite = favorite
                }
            }
            else if type == "chemex" {
                if let index = chemex_data.index(where: {$0.name == r.name && $0.type.rawValue == type}) {
                    chemex_data[index].favorite = favorite
                }
            }
            else if type == "hario" {
                if let index = hario_data.index(where: {$0.name == r.name && $0.type.rawValue == type}) {
                    hario_data[index].favorite = favorite
                }
            }
            else if type == "french" {
                if let index = french_data.index(where: {$0.name == r.name && $0.type.rawValue == type}) {
                    french_data[index].favorite = favorite
                }
            }
        }
    }
    
    func setHeartImage() {
        if favorite {
            favoriteButton.setImage(UIImage(named: "heartFilled"),for: .normal)
        }
        else {
            favoriteButton.setImage(UIImage(named: "heartOutline"),for: .normal)
        }
    }
    
    func setLabels() {
        if Preferences["degree"]  == "celsius" {
            if let tempInt = Int(temp) {
                temperatureLabel.text = String(convertToCelsius(tempInt)) + "°C"
            }
        }
        else {
            temperatureLabel.text = temp + "°F"
        }

        if Preferences["scale"] == "standard" {
            if let w = Double (weight) {
                weightLabel.text = String (format: "%.2f", convertToOunces(w)) + "oz"
            }
            if let w = Double (water) {
                waterLabel.text = String (format: "%.2f", convertToOunces(w)) + "oz"
            }
        }
        else {
            weightLabel.text = weight + "g"
            waterLabel.text  = water + "g"
        }
    }

    func convertToCelsius (_ value : Int) -> Int {
        return Int((Double((value-32))*(5/9)))
    }

    func convertToOunces (_ value : Double) -> Double {
        return value / 28.35
    }
}
