//
//  BarreDeNavigation.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-03-03.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//

import UIKit

@IBDesignable
class BarreDeNavigation: UINavigationBar {  //Bon la on va custom la barre du haut mais c secondaire

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1).cgColor
        self.layer.cornerRadius = CGFloat(20.0)
    }

}
