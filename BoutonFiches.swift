//
//  BoutonFiches.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-03-01.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//

import UIKit

@IBDesignable
class BoutonFiches: UIButton, UIGestureRecognizerDelegate {

    var selectWinner: Bool = false
    var selectChoice: Bool = false 

    let Vert = UIColor(red: 0.44, green: 0.81, blue: 0.59, alpha: 1)
    let Rouge = UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 1)

    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CGFloat(10.0)
        
    
    }
    

    
    
    
    
        
        
}
    

