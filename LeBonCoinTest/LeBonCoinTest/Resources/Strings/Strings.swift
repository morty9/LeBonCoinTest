//
//  Strings.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

enum Strings: String {
    case nav_bar_title_list_controller = "controllers.list_controller.nav_bar_title_list_controller"
    case is_urgent = "app.vocabulary.is_urgent"
    case picker_view_button_title = "controllers.list_controller.picker_view_button_title"
    case filter_label = "controllers.list_controller.filter_label"
    case nav_bar_title_details_controller = "controllers.item_details_controller.nav_bar_title_details_controller"
    case price_label = "controllers.item_details_controller.price_label"
    case description_label = "controllers.item_details_controller.description_label"
    case no_item_label = "controllers.item_details_controller.no_item_label"
    case siret_label = "controllers.item_details_controller.siret_label"
    
    var localized: String {
        return self.rawValue.localized()
    }
}
