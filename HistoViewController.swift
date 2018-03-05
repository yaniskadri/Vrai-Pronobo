//
//  HistoViewController.swift
//  Pronobo the real shit
//
//  Created by Yanis Kadri on 2018-03-03.
//  Copyright © 2018 Vyck Apps. All rights reserved.
//

import UIKit

class HistoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {  //Okkk la c un tableView jv pas commenter, jte laisse guetter des tutos et videos pour comprendre
    @IBOutlet weak var histoTableView: UITableView!
    
    var Matchs = [Match]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchLesMatchs = CoreDataManager.fetchMatchs()
        self.Matchs = fetchLesMatchs
        
        histoTableView.separatorStyle = .none

        
        histoTableView.delegate = self
        histoTableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Matchs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = histoTableView.dequeueReusableCell(withIdentifier: "cellMatch") as! CellHistoTableViewCell
        cell.imageDeLaCell(gagne: Matchs[indexPath.row].gagne)
        cell.gainDeLaCell(gain: Matchs[indexPath.row].gain)
        cell.dateDeLaCell(date: "12/12")
        if let oui = Matchs[indexPath.row].nomDom {
            if let non = Matchs[indexPath.row].nomExt {
                cell.nomDeLaCell(nomDom: oui, nomExt: non)
            }
        }

        return cell
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
