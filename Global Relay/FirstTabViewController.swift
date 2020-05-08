//
//  FirstTabViewController.swift.swift
//  Global Relay
//
//  Created by Parth Patel on 06/05/20.
//  Copyright © 2020 Parth Patel. All rights reserved.
//

import UIKit

class FirstTabViewController: UIViewController {
    
    lazy var countryDetails: [CountryDetails] = {
        return CountryDetails.countryDetails()
    }()
    
    
    @IBOutlet weak var tableView: UITableView!
    var lastSelectedIndex = (0,0)
    
    
    // MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        updateTimer()
    }
    
    
    // MARK: - Manage Timer
    func shuffleCards(cards:inout [Country]) {
        cards = cards.shuffled()
    }
    
    func updateTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { timer in
            
            for (index,_) in self.countryDetails.enumerated() {
                self.shuffleCards(cards: &self.countryDetails[index].country)
            }
            self.tableView.reloadData()
            
            let userData = self.countryAtIndexPath(section: self.lastSelectedIndex.0, row: self.lastSelectedIndex.1)
            NotificationCenter.default.post(name: Notification.Name("timerUpdate"), object: nil, userInfo: ["data" : userData])
        })
    }
    
    
    // MARK: - Helper Method
    func countryAtIndexPath(section: Int, row: Int) -> Country
    {
        let countrydetail = countryDetails[section]
        return countrydetail.country[row]
    }
    
}

extension FirstTabViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countryDetails.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = countryDetails[section]
        return title.name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let title = countryDetails[section]
        return title.country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "table_cell", for: indexPath) as! CountryTableViewCell
        
        let countryDetail = countryDetails[indexPath.section]
        let country = countryDetail.country[indexPath.row]
        
        cell.configureCellWith(country)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        lastSelectedIndex = (indexPath.section,indexPath.row)
        self.performSegue(withIdentifier: "show_detail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "show_detail",
            let destination = segue.destination as? DetailViewController
        {
            if let indexPath = sender as? NSIndexPath {
                destination.country = countryAtIndexPath(section: indexPath.section, row: indexPath.row)
            }
        }
    }
}
