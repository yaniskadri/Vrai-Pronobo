//
//  ficheMatchViewController.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-03-02.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//

import UIKit
import CoreData

class ficheMatchViewController: UIViewController, UITextFieldDelegate {
    
    var matchEnCoursSuite: Match? = Match()   //le "?" c pck on est pas sur que les donnes vont bien etre transferees, donc on donne un type optionel
    
    @IBOutlet weak var fiche: UIImageView!
    @IBOutlet weak var nomHome: LabelFiche!
    @IBOutlet weak var nomAway: LabelFiche!
    @IBOutlet weak var labelNul: LabelFiche!
    @IBOutlet weak var championnat: LabelFiche!
    @IBOutlet weak var coteDom: LabelFiche!
    @IBOutlet weak var coteNul: LabelFiche!
    @IBOutlet weak var coteAway: LabelFiche!
    @IBOutlet weak var mise: LabelFiche!
    @IBOutlet weak var fieldCommentaires: TextFieldFiche!
    @IBOutlet weak var gain: LabelFiche!
    
    
    
    //MARK: Bails annexes
    func affichageDuMatch()  {    //oklm
        if let aaa = matchEnCoursSuite?.nomDom {
            nomHome.text = aaa
        }
        
        if let bbb = matchEnCoursSuite?.nomExt {
            nomAway.text = bbb
        }
        
        if let ccc = matchEnCoursSuite?.competition {
            championnat.text = ccc
        }
        
        if let ddd = matchEnCoursSuite?.coteDom {
            coteDom.text = String(ddd)
        }
        
        if let eee = matchEnCoursSuite?.coteNul {
            coteNul.text = String(eee)
        }
        
        if let fff = matchEnCoursSuite?.coteExt {
            coteAway.text = String(fff)
        }
        
        if let ggg = matchEnCoursSuite?.mise {
            mise.text = String(ggg)
        }
        
        if let hhh = matchEnCoursSuite?.gain {
            gain.text = String(hhh)
        }
        
        switch matchEnCoursSuite!.choix {   //labelGagnant c un truc que g defini dans ma custom class "Labelfiche" va guetter
        case Int16(1):
            nomHome.labelGagnant = true
        case Int16(2):
           labelNul.labelGagnant = true
        case Int16(3):
           nomAway.labelGagnant = true
        default:
            break
        }
        
    }
    


    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let choix = matchEnCoursSuite?.choix {           //securite
            if let resultat = matchEnCoursSuite?.resultat{  //double securite
                if choix == resultat {  //on verifie si le gars a gagne  si oui
                    matchEnCoursSuite!.gagne = true
                    switch matchEnCoursSuite!.choix {  //alors en fonction de la cote on definit son gain
                    case 1:
                        matchEnCoursSuite!.gain = matchEnCoursSuite!.mise * matchEnCoursSuite!.coteDom  //le point d'exc c pour forcer le deballage d'une optionnelle (contraire de if let)
                    case 2:
                        matchEnCoursSuite!.gain = matchEnCoursSuite!.mise * matchEnCoursSuite!.coteNul //en gros on affirme que y'a pas nil
                    case 3:
                        matchEnCoursSuite!.gain = matchEnCoursSuite!.mise * matchEnCoursSuite!.coteExt  //c risque donc a eviter, la je l'ai fait par flemme
                    default:
                        matchEnCoursSuite!.gain = 0.0}
                    fiche.image = UIImage(named: "ficheVerte")
                } else {
                    matchEnCoursSuite!.gagne = false
                    matchEnCoursSuite!.gain = -matchEnCoursSuite!.mise
                       fiche.image = UIImage(named: "ficheRouge")   //voila comment on change une image
                }
            }
        }
        
        affichageDuMatch()   //hop on affiche le match avec la fonction definie plus haut
        
    }
        
      
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {  //sa tu connais mtn
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fieldCommentaires.resignFirstResponder()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let texte = textField.text {
            matchEnCoursSuite?.commentaires = texte
        }
        
        return true
    }
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ficheToHisto"{
        if let matchATransf = matchEnCoursSuite {
            CoreDataManager.storeMatch(match: matchATransf)         //et la on SAVE le match, va voir le fichier CoreDataManager j'explique le bail
        }
        }
    }
 

}

