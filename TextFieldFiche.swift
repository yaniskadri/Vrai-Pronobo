//
//  TextFieldFiche.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-03-01.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//

import UIKit

@IBDesignable
class TextFieldFiche: UITextField {
    
    var selectionne: Bool = false

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CGFloat(10.0)
        
        if self.tag == 10 {
            self.layer.borderWidth = CGFloat(2)
            self.layer.borderColor = (UIColor.yellow).cgColor }
        
        if self.selectionne == true {
            self.layer.borderWidth = CGFloat(2)
            self.layer.borderColor = (UIColor.black).cgColor
        } else {
            self.layer.borderWidth = CGFloat(0)
        }
        
    }
    
}
