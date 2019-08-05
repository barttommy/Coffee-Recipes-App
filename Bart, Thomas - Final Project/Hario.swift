//
//  Hario.swift
//  Bart, Thomas - Final Project
//
//  Created by Thomas Bart on 3/13/19.
//  Copyright © 2019 Thomas Bart. All rights reserved.
//

import Foundation

var hario_data = [
    
    Hario   (name: "Sweet and easy",
             type: .hario,
             weight: "16",
             water: "300",
             temp: "198",
             author: "coffee.cup.guru",
             recipe:    "1. Grind 16g of Coffee (Medium)\n" +
                        "2. Rinse filter\n" +
                        "3. Add 16g of coffee and 33g of water\n" +
                        "4. Bloom 45s\n" +
                        "5. Pour the rest of the water\n" +
                        "6. Enjoy!",
             favorite: false),
    
    Hario (name: "Iced Coffee",
           type: .hario,
           weight: "16",
           water: "180",
           temp: "198",
           author: "coffee.cup.guru",
           recipe:  "1. Grind 16g of coffee (Medium)\n" +
                    "2. Rinse filter and add ice into cup\n" +
                    "3. Add coffee and 32g of water\n" +
                    "4. Bloom 30s\n" +
                    "5. Pour the rest of water\n" +
                    "6. Enjoy!",
           favorite: false),
    
    Hario (name: "Rich Taste",
           type: .hario,
           weight: "18",
           water: "300",
           temp: "200",
           author: "coffee.cup.guru",
           recipe:  "1. Grind 18g of Coffee (Medium)\n" +
                    "2. Rinse filter\n" +
                    "3. Add coffee 37g of water, then stir\n" +
                    "4. Bloom 20s\n" +
                    "5. Pour the rest of the water\n" +
                    "6. Enjoy!",
           favorite: false),
    
    Hario (name: "V60 Recipe",
           type: .hario,
           weight: "25",
           water: "300",
           temp: "199",
           author: "Hario Company",
           recipe:  "1. Grind 25g of Coffee (Medium)\n" +
                    "2. Rinse filter\n" +
                    "3. Add 25g of coffee and 50g of water\n" +
                    "4. Bloom 30s\n" +
                    "5. Pour the rest of the water\n" +
                    "6. Enjoy!",
           favorite: false),
]

class Hario {
    enum `Type` : String {
        case hario = "hario"
    }
    
    var name     : String
    var type     : Type
    var weight   : String
    var water     : String
    var temp     : String
    var author   : String
    var recipe   : String
    var favorite : Bool
    
    init (name: String, type: Type, weight: String, water: String, temp: String, author: String, recipe: String, favorite: Bool) {
        self.name = name
        self.type = type
        self.weight = weight
        self.water = water
        self.temp = temp
        self.author = author
        self.recipe = recipe
        self.favorite = favorite
    }
}
