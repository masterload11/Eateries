//
//  AboutTableViewController.swift
//  Eateries
//
//  Created by Владислав Варфоломеев on 08.05.2018.
//  Copyright © 2018 Владислав Варфоломеев. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController
{
    let sectionsHeaders = ["Соц.сети", "Web-сайты"]
    let sectionsContent = [["Facebook", "Telegram", "Medium"], ["varfolomeev.com", "tilda.cc"]]
    let firstSectionLinks = ["https://www.facebook.com/profile.php?id=100007574624119", "https://t.me/mineOS", "https://medium.com/@vladislavvarfolomeev"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView(frame: .zero)
    }

    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsHeaders.count
    }
    //метод для вывода section Headers
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsHeaders[section]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionsContent[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = sectionsContent[indexPath.section][indexPath.row]

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //выполнить segue на webPage по клику на row 0ой секции 
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0..<firstSectionLinks.count:
                performSegue(withIdentifier: "showWebPageSegue", sender: self)
            default: break
            }
        default:
            break
        }
       
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //передаём информацию в свойство url нашего webViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebPageSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! WebViewController
                dvc.url = URL(string: firstSectionLinks[indexPath.row])
            }
        }
    }
}
