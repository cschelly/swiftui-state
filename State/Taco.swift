//
//  Taco.swift
//  State
//
//  Created by Christina S on 11/16/19.
//  Copyright © 2019 Schelly. All rights reserved.
//

import Foundation

struct Taco {
    var protein: TacoProtein = .shrimp
    var sauce: TacoSauce = .cilantroLime
    var cheese: TacoCheese = .cotija
    var tortilla: TacoTortilla = .flour
    var spice: TacoSpice = .hot
    
    var orderReview: String {
        return """
                A \(protein) taco with \(spice)
                level spice on a \(tortilla) tortilla. Your toppings
                include \(cheese.rawValue) and \(sauce.rawValue) sauce.
               """
    }
}

enum TacoProtein: String, CaseIterable {
    case fish, chicken, steak, shrimp, tofu
}

enum TacoSauce: String, CaseIterable {
    case chipotle,
    cilantroLime = "cilantro lime",
    picoDeGallo = "pico de gallo",
    salsaVerde = "salsa verde"
}

enum TacoCheese: String, CaseIterable {
    case cheddar, cotija, vegan, monteryJack = "montery jack"
}

enum TacoTortilla: String, CaseIterable {
    case corn, flour
}

enum TacoSpice: String, CaseIterable {
    case mild, medium, hot
}
