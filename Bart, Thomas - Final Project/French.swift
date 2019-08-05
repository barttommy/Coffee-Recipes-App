//
//  French.swift
//  Bart, Thomas - Final Project
//
//  Created by Thomas Bart on 3/13/19.
//  Copyright © 2019 Thomas Bart. All rights reserved.
//

import Foundation

var french_data = [
    
    French (name: "Kitchn",
            type: .french,
            weight: "25",
            water: "300",
            temp: "196",
            author: "The Kitchn",
            recipe:
                    "1. Grind coffee (Coarse)\n" +
                    "2. Add coffee and 500g of water\n" +
                    "3. Stir\n" +
                    "4. Brew 4 minutes\n" +
                    "5. Slowly press plunger down\n" +
                    "6. Enjoy!",
            favorite: false),
    
    French (name: "French Press",
            type: .french,
            weight: "20",
            water: "300",
            temp: "205",
            author: "coffee.cup.guru",
            recipe:
                "1. Grind 20g of coffee (Medium-Course)\n" +
                "2. Add coffee and 250g of water\n" +
                "3. Stir\n" +
                "4. Add the rest of water\n" +
                "5. Brew 4 minutes\n" +
                "6. Slowly press plunge down\n" +
                "7. Enjoy!",
            favorite: false),
    
    French (name: "Long stir, long brew",
            type: .french,
            weight: "20",
            water: "300",
            temp: "199",
            author: "coffee.cup.guru",
            recipe:
            "1. Grind coffee (Extra Coarse)\n" +
            "2. Add coffee and 300g of water\n" +
            "3. Stir 45s\n" +
            "4. Brew 6 minutes\n" +
            "5. Slowly press plunger down\n" +
            "6. Enjoy!",
            favorite: false),
    
    French (name: "Beginner Recipe",
            type: .french,
            weight: "25",
            water: "300",
            temp: "199",
            author: "coffee.cup.guru",
            recipe:
            "1. Grind coffee (Coarse)\n" +
            "2. Add coffee and 300g of water\n" +
            "3. Stir\n" +
            "4. Brew 3:30 minutes\n" +
            "5. Slowly press plunger down\n" +
            "6. Enjoy!",
            favorite: false),
    
]

class French {
    enum `Type` : String {
        case french = "french"
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
