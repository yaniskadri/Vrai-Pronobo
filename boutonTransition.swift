//
//  boutonTransition.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-03-02.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//

import UIKit

@IBDesignable
class boutonTransition: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = CGFloat(10)
    }

}
