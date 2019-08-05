//
//  AeroPress.swift
//  Bart, Thomas - Final Project
//
//  Created by Thomas Bart on 3/13/19.
//  Copyright © 2019 Thomas Bart. All rights reserved.
//

import Foundation


var aero_data = [
    
    AeroPress (name: "Slovak Championship Winner 2016",
             type: .inverted,
             weight: "18",
             water: "240",
             temp: "176",
             author: "Matus Gajdos",
             recipe:
                "1. Grind 18 grams of coffee (Coarse)\n" +
                "2. Rinse Filter\n" +
                "3. Add coffee and 240 grams of water\n" +
                "4. Brew 2 minutes and 30 seconds\n" +
                "5. Stir\n" +
                "6. Press (15 seconds)\n" +
                "7. Enjoy!",
             favorite: false),
    
    AeroPress (name: "Camping Recipe",
               type: .classic,
               weight: "17",
               water: "220",
               temp: "185",
               author: "Stump Town Coffee",
               recipe:
                "1. Grind 17 grams of coffee (Fine)\n" +
                "2. Rinse Filter\n" +
                "3. Add coffee and 220 grams of water\n" +
                "4. Stir, then brew 1 minute\n" +
                "5. Stir\n" +
                "6. Press\n" +
                "7. Enjoy!",
               favorite: false),
    
    AeroPress (name: "Basic Recipe",
               type: .inverted,
               weight: "17",
               water: "180",
               temp: "198",
               author: "coffee.cup.guru",
               recipe:
                "1. Grind 17g of Coffee (Medium)\n" +
                "2. Add 17g of coffee and 90g of water\n" +
                "3. Stir well\n" +
                "4. Add the rest of the water\n" +
                "5. Brew one minute\n" +
                "6. Press (20 seconds)\n" +
                "7. Enjoy!",
               favorite: false),
    
    AeroPress (name: "Brew Recipe",
               type: .classic,
               weight: "18",
               water: "270",
               temp: "199",
               author: "HeartRoasters.com",
               recipe:
                "1. Grind 18 grams of coffee (Medium)\n" +
                "2. Rinse Filter\n" +
                "3. Quickly add coffee and 270 grams of water\n" +
                "4. Stir then brew 40s\n" +
                "5. Stir\n" +
                "6. Brew 50s, then press\n" +
                "7. Enjoy!",
               favorite: false),
]

class AeroPress {
    enum `Type` : String {
        case classic  = "classic"
        case inverted = "inverted"
    }
    
    var name     : String
    var type     : Type
    var weight   : String
    var water    : String
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
