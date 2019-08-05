//
//  Chemex.swift
//  Bart, Thomas - Final Project
//
//  Created by Thomas Bart on 3/13/19.
//  Copyright © 2019 Thomas Bart. All rights reserved.
//

import Foundation

var chemex_data = [
    
    Chemex (name: "Chemex Recipe",
           type: .chemex,
           weight: "20",
           water: "300",
           temp: "196",
           author: "coff32labs",
           recipe:
                "1. Grind 35g of Coffee (Medium)\n" +
                "2. Rinse filter\n" +
                "3. Add coffee and 40g of water\n" +
                "4. Bloom 45s\n" +
                "5. Pour the rest of the water\n" +
                "6. Enjoy!",
            favorite: false),
    
    Chemex (name: "Sweet and easy",
            type: .chemex,
            weight: "21",
            water: "300",
            temp: "196",
            author: "coffee.cup.guru",
            recipe:
            "1. Grind 21g of Coffee (Medium)\n" +
            "2. Rinse filter\n" +
            "3. Add coffee and 42g of water\n" +
            "4. Bloom 45s\n" +
            "5. Pour the rest of the water\n" +
            "6. Enjoy!",
            favorite: false),
    
    Chemex (name: "Longer bloom",
            type: .chemex,
            weight: "20",
            water: "300",
            temp: "200",
            author: "coffee.cup.guru",
            recipe:
            "1. Grind 20g of Coffee (Medium)\n" +
            "2. Rinse filter\n" +
            "3. Add coffee and 40g of water\n" +
            "4. Bloom 60s\n" +
            "5. Pour the rest of the water\n" +
            "6. Enjoy!",
            favorite: false),
    
    Chemex (name: "High temperature",
            type: .chemex,
            weight: "22",
            water: "300",
            temp: "205",
            author: "coffee.cup.guru",
            recipe:
            "1. Grind 22g of Coffee (Medium)\n" +
            "2. Rinse filter\n" +
            "3. Add coffee and 43g of water\n" +
            "4. Stir 10s\n" +
            "5. Pour the rest of the water\n" +
            "6. Enjoy!",
            favorite: false),
]

class Chemex {
    enum `Type` : String {
        case chemex = "chemex"
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
