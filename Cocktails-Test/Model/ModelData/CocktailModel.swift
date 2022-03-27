//
//  CocktailModel.swift
//  Cocktails-Test
//
//  Created by Kirill Drozdov on 26.03.2022.
//

import Foundation

struct Cocktail: Codable {
  let drinks: [Drink]
}

struct Drink: Codable {
  let strDrink: String
  let strDrinkThumb: String
  let idDrink: String
}
