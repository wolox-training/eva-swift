//
//  UIButtonExtension.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/15/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

extension UIButton {
    
    func enable()  {
        self.setGradient(colors: [UIColor(hex:"00ADEE")!, UIColor(hex: "38CCCD")!])
    }
    
    func disable() {
        self.setGradient(colors: [UIColor(hex:"EAEAEA")!, UIColor(hex: "F4F4F4")!])
    }
    
    func setGradient(colors: [UIColor]){
        self.gradient = ViewGradient(colors: colors, direction: .leftToRight)
    }
}
