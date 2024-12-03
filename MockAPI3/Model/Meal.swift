//
//  Meal.swift
//  MockAPI3
//
//  Created by Muralidhar reddy Kakanuru on 12/3/24.
//

import Foundation
struct MealResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable{
    let idMeal: String?
    let strMeal: String?
    let strMealThumb: String?
}
