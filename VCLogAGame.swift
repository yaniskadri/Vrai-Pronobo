//
//  VCLogAGame.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-02-28.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//

import UIKit
import CoreData

class VCLogAGame: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {    //Bon on passe au choses serieuses la, batard va
    
   
    
    //MARK: Propriétés
    @IBOutlet weak var fieldHomeTeam: TextFieldFiche!                               //La ta capte c les bails du view controller
    @IBOutlet weak var fieldAwayTeam: TextFieldFiche!
    @IBOutlet weak var fieldCompetition: TextFieldFiche!
    @IBOutlet weak var fieldCoteDom: TextFieldFiche!
    @IBOutlet weak var fieldCoteNul: TextFieldFiche!
    @IBOutlet weak var fieldCoteExt: TextFieldFiche!
    @IBOutlet weak var fieldMise: TextFieldFiche!
    @IBOutlet weak var boutonWinNul: BoutonFiches!
    @IBOutlet weak var potentialWin: UILabel!
    @IBOutlet weak var boutonNul: BoutonFiches!
    @IBOutlet weak var boutonWinAway: BoutonFiches!
    @IBOutlet weak var boutonWinHome: BoutonFiches!
    
    //MARK: CoreData
    var matchEnCours = NSEntityDescription.insertNewObject(forEntityName: "Match", into: CoreDataManager.getContext()) as! Match  //voila la syntaxe pour creer un nouvel objet de type Match
    //Quon pourra ensuite reutiliser. Et tu verras en dessous que sa marche comme une classe normale

    

    
    //MARK: Bails annexes
    let alerteCoteNonValide = UIAlertController(title: "Invalid odd", message: "Please enter an odd in the european format", preferredStyle: .alert)
    let alerteStringNonValide = UIAlertController(title: "Invalid input", message: "Please enter a valid name", preferredStyle: .alert)
    //Sa c les alertes quand l'utilisateur fait de la merde, on les customise apres et ptet meme qu'on lachera des insultes, a voir...
    
    func someHandler(alert: UIAlertAction){
        
    }
    
    
    
    //la jsuis dans une galere avec la date
    
  /*  func getDate() -> String {
        let calendar = Calendar.autoupdatingCurrent
        let components = calendar.dateComponents([.month, .day], from: Date())
        let mois = String(describing: components.month)
        let jour = String(describing: components.day)
        let date = mois + "/" + jour
        return date

    } */
    
    

  //Voila la fonction appellee des que la vue se charge
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alerteCoteNonValide.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: someHandler))
        alerteStringNonValide.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: someHandler))
        
        for bouton in [boutonWinHome, boutonWinNul, boutonWinAway]{     //Bon sa tu connais mgl, reprend la meme syntaxe si tu veux ajouter des gestures recognizer en code
            let longpress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress(recognizer:)))
            let doubleTap = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap(recognizer:)))
            doubleTap.numberOfTapsRequired = 2
            bouton?.addGestureRecognizer(longpress)
            bouton?.addGestureRecognizer(doubleTap)
            
        }
        
        //matchEnCours.date = getDate()    ==> galere avec la date tjrs
        
        
        //Pas trop capté sa sert a quoi mais on lfait [edit] : enft si c pour attribuer le "stack" de fonctions (delegate) a chacun des outlets qu'on a fait
        fieldHomeTeam.delegate = self
        fieldMise.delegate = self
        fieldAwayTeam.delegate = self
        fieldCompetition.delegate = self
        fieldCoteDom.delegate = self
        fieldCoteNul.delegate = self
        fieldCoteExt.delegate = self
        fieldMise.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {     //Sa g pas compris mais nsm on verra a la fin
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    //MARK: Actions
    
    @IBAction func appuiBoutonNul(_ sender: BoutonFiches) {   //Pour activer/desactiver le nul. Guette le "!" il sert a dire "l'inverse de" pour un Bool
        fieldCoteNul.isHidden = !fieldCoteNul.isHidden
        boutonWinNul.isHidden = !boutonWinNul.isHidden
    }
    
   @objc func didLongPress(recognizer: UILongPressGestureRecognizer){   //vu au dernier cours
        guard let bouton = recognizer.view as? BoutonFiches
            else { return }
    
    let boutonsTableau: [BoutonFiches] = [boutonWinHome, boutonWinNul, boutonWinAway]
    for boutonne in boutonsTableau {
        if boutonne === bouton {
            boutonne.layer.borderWidth = CGFloat(5.0)
            boutonne.layer.borderColor = UIColor.black.cgColor
            matchEnCours.choix = Int16(boutonne.tag)
            if self.fieldMise.text != ""{
                switch boutonne.tag {
                case 1:
                    let gainPot = matchEnCours.mise * matchEnCours.coteDom
                    potentialWin.text = String(gainPot)
                case 2:
                    let gainPot = matchEnCours.mise * matchEnCours.coteNul
                    potentialWin.text = String(gainPot)
                case 3:
                    let gainPot = matchEnCours.mise * matchEnCours.coteExt
                    potentialWin.text = String(gainPot)
                default:
                potentialWin.text = "cote non entree"
                    
                }
            }
       
        } else {
            boutonne.layer.borderWidth = CGFloat(0.0)
        }
    }
    }
    
    
   @objc func didDoubleTap(recognizer: UITapGestureRecognizer){  //vu au dernier cours chakal
        guard let bouton = recognizer.view
            else {
                return
        }
    let boutonsTableau: [BoutonFiches] = [boutonWinHome, boutonWinNul, boutonWinAway]
    for boutonne in boutonsTableau {
        if boutonne === bouton {
            boutonne.backgroundColor = boutonne.Vert
            matchEnCours.resultat = Int16(boutonne.tag)
        } else {
            boutonne.backgroundColor = boutonne.Rouge
        }
    }
    }
    
    
    

  
    
    
    
    
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //Une fonction du delegate qui est appellee des qu'on appuie sur return
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {  //fonction appelle qusand l"utilisateur appuie autre part que sur le textfield
        fieldCoteDom.resignFirstResponder()
        fieldCoteExt.resignFirstResponder()
        fieldCoteNul.resignFirstResponder()
        fieldMise.resignFirstResponder()    }
    
    
     func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{   //Le bail pour stocker dans matchEnCours

        switch textField.tag {  //g attribue un tag different a chaque textfield
        case 1:
            if let nom = textField.text {  //on la joue safe avec un if let
                matchEnCours.nomDom = nom  //on accede a la variable de matchEnCours deifini plus haut comme une classe normale
            } else { self.present(alerteStringNonValide, animated: true, completion: nil)}  //sinon on popup une alerte
        case 2:
            if let nom2 = textField.text {
             matchEnCours.nomExt = nom2
             } else { self.present(alerteStringNonValide, animated: true, completion: nil)}
        case 3:
            if let compet = textField.text {
             matchEnCours.competition = compet
             } else { self.present(alerteStringNonValide, animated: true, completion: nil)}
        case 4:
            if let cote = Double(textField.text!) {
            matchEnCours.coteDom = cote
            } else {
                self.present(alerteCoteNonValide, animated: true, completion: nil) }  //Si tu galere, écoute "recherché" de Naps
        case 5:
            if let cote2 = Double(textField.text!) {
             self.matchEnCours.coteNul = cote2
             } else {
             self.present(alerteCoteNonValide, animated: true, completion: nil) }
        case 6:
            if let cote3 = Double(textField.text!) {
             self.matchEnCours.coteExt = cote3
             } else {
             self.present(alerteCoteNonValide, animated: true, completion: nil) }  //Jtrouve c pompé sur Jul en bal mais trql
        case 7:
            if let mise = Double(textField.text!) {
                matchEnCours.mise = mise
            } else {
                self.present(alerteCoteNonValide, animated: true, completion: nil) }
        default:
            print("erreur, un textfield sans tag a été édité")
        }
        
        return true
    }

    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {    //la fonction appelle avant un segue, une transition
      
        if segue.identifier ==  "logToFiche" {  //identifier défini dans le storyboard, tu trouveras en cliquant sur le segue dans les bails a droite
            let vc = segue.destination as? ficheMatchViewController
            vc?.matchEnCoursSuite? = self.matchEnCours  //on transfere le matchEnCours a matchEnCoursSuite de la fiche de Match
        } else {
            print("erreur de transfert")  //Oh j'y pense on est teubés on a pas pris en photo le tableau avant de quitter LA salle :/
        }
        
    }
     
}

