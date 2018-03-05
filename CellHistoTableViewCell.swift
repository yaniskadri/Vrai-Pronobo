//
//  CellHistoTableViewCell.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-03-03.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//

import UIKit

class CellHistoTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var gainLabel: UILabel!
    @IBOutlet weak var imageFond: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = CGFloat(10.0)
    }
    
    
    func imageDeLaCell(gagne: Bool){
        if gagne  {
            self.imageFond.image = UIImage(named: "framehistoVert")
        } else {
            self.imageFond.image = UIImage(named: "framehistoRouge")
        }
            
    }
    
    func dateDeLaCell(date: String){
        //nsm
        self.dateLabel.text = date
    }
    
    func gainDeLaCell(gain: Double) {
        self.gainLabel.text = String(describing: gain)
    }
    
    func nomDeLaCell (nomDom: String, nomExt: String){
        self.nomLabel.text = nomDom + " x " + nomExt
    }
    
}


