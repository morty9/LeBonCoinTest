//
//  UIView+Extension.swift
//  LeBonCoinTest
//
//  Created by Bérangère La Touche on 22/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Fade in a view with a duration
    ///
    /// Parameter duration: custom animation duration
    func fadeIn(withDuration duration: TimeInterval = 1.0, completion: @escaping () -> () = {}) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        }) { (animationDone) in
            if animationDone {
                completion()
            }
        }

    }

    /// Fade out a view with a duration
    ///
    /// - Parameter duration: custom animation duration
    func fadeOut(withDuration duration: TimeInterval = 1.0, completion: @escaping () -> () = {}) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }) { (animationDone) in
            if animationDone {
                completion()
            }
        }
    }
    
}
