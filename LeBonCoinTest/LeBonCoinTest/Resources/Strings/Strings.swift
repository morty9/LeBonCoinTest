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
    
    var localized: String {
        return self.rawValue.localized()
    }
}
