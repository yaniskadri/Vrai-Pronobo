//
//  CoreDataManager.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-03-04.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//


import CoreData
import UIKit

class CoreDataManager: NSObject {
    
    class func getContext() -> NSManagedObjectContext   {                 //Une fonction pour appeller le contexte(la boite a donnees) de l'appli
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    
    
    class func storeMatch(match: NSManagedObject) {         //Une fonction que t'appelles quand tu veux stocker un match definitivement
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Match", in: context)
        var managedObj = NSManagedObject(entity: entity!, insertInto: context)
        
       managedObj = match
        
        do {
            try context.save()                                      //Le do-try c pour gerer les erreurs, genre si le try marche pas ca fait le catch et ca evite a l'appli de crasher
        } catch  {
            print("erreur dans la sauvegarde du match")
        }

    }
    
    
    
    class func fetchMatchs() -> [Match] {    //Fonction pour recup tous les matchs stockés en memoire jusqu'a present qui retourne un tableau avec tous les matchs
        var lesMatchs = [Match]()
        
        let fetchRequest: NSFetchRequest<Match> = Match.fetchRequest()
        
        do {
            let fetchResult =  try getContext().fetch(fetchRequest)
            for match in fetchResult {
                lesMatchs.append(match)             //.append ca sert a ajouter un element au tableau, en gros la on va chercher tous les matchs, et on ajoute tou
            }                                       //s les matchs dans un tableau pour le renvoyer en sortie
            return lesMatchs
        } catch  {
            print("erreur de fetch")
        }
        
        return lesMatchs
    }
    
}





