//
//  CustomTextfield.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
class CustomTextfield:UITextField {
    override init(frame: CGRect) {
        super.init(frame:frame)
        textColor = .green
        backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
