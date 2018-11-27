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
import ReactiveCocoa
import ReactiveSwift

final class AddBookView: UIView, NibLoadable {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var submitButton: UIButton!{
        didSet{
            submitButton.enable()
        }
    }
    @IBOutlet weak var authorTextField: UITextField!{
        didSet{
            authorTextField.setInlineStyle()
        }
    }
    @IBOutlet weak var yearTextField: UITextField!{
        didSet{
            yearTextField.setInlineStyle()
        }
    }
    @IBOutlet weak var topicTextField: UITextField!{
        didSet{
            topicTextField.setInlineStyle()
        }
    }
    @IBOutlet weak var descriptionTextField: UITextField!{
        didSet{
            descriptionTextField.setInlineStyle()
        }
    }
    @IBOutlet weak var bookNameTextField: UITextField!{
        didSet{
            bookNameTextField.setInlineStyle()
        }
    }
    @IBOutlet weak var bookTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .backgroundColor
        setUpViews()
    }
    
    func clearTextfields() {
        bookNameTextField.text = ""
        authorTextField.text = ""
        yearTextField.text = ""
        topicTextField.text = ""
        descriptionTextField.text = ""
    }
    
}

private extension AddBookView {
    
    private func setUpViews() {
        
    }
    
}
