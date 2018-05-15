//
//  offsetTextField.swift
//  justChat
//
//  Created by Rehan Parkar on 2018-05-14.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class offsetTextField: UITextField {

    //private var textOffset: CFloat = 20
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        self.attributedPlaceholder = placeholder
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return  UIEdgeInsetsInsetRect(bounds, padding)
        
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return  UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return  UIEdgeInsetsInsetRect(bounds, padding)
    }

}
