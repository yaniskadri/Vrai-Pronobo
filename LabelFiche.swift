//
//  LabelFiche.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-03-02.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//

import UIKit

@IBDesignable
class LabelFiche: UILabel {
    var labelGagnant: Bool = false

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CGFloat(10.0)
        
        if self.labelGagnant == true {
            self.layer.borderWidth = CGFloat(5.0)
            self.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    
    

}
