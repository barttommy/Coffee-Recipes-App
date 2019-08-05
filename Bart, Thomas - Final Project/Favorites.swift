//
//  Favorites.swift
//  Bart, Thomas - Final Project
//
//  Created by Thomas Bart on 3/15/19.
//  Copyright © 2019 Thomas Bart. All rights reserved.
//

import Foundation

var favorite_data = [Favorites]()

enum `Type` : String {
    case classic  = "classic"
    case inverted = "inverted"
    case chemex   = "chemex"
    case hario    = "hario"
    case french   = "french"
}

class Favorites {
    var name     : String
    var type     : Type
    var weight   : String
    var water    : String
    var temp     : String
    var author   : String
    var recipe   : String
    var favorite : Bool
    
    init (name: String, type: Type, weight: String, water: String, temp: String, author: String, recipe: String, favorite : Bool) {
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
