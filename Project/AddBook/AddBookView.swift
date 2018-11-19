//
//  AddBookView.swift
//  Project
//
//  Created by Emmanuel Velez Agudelo on 11/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

final class AddBookView: UIView, NibLoadable {
    
    @IBOutlet weak var submitButton: UIButton!{
        didSet{
            submitButton.enable()
        }
    }
    @IBOutlet weak var bookName: CustomTextfield!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .backgroundColor
        setUpViews()
    }
    
}

private extension AddBookView {
    
    private func setUpViews() {
        
    }
    
}
