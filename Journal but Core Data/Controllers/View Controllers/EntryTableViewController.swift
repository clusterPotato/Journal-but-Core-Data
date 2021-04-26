//
//  EntryTableViewController.swift
//  Journal but Core Data
//
//  Created by Gavin Craft on 4/26/21.
//

import UIKit

class EntryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.shared.fetchEntries()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath) as? EntryTableViewCell else {return UITableViewCell()}
        let dateFormatter = DateFormatter()
        let entry = EntryController.shared.entries[indexPath.row]
        dateFormatter.dateStyle = .short
        cell.dateLabel.text = dateFormatter.string(from: entry.timestamp ?? Date())
        cell.nameLabel.text = entry.title

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            EntryController.shared.deleteEntry(entry: EntryController.shared.entries[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        guard let detailVC = segue.destination as? EntryDetailViewController else {return}
        detailVC.entry = EntryController.shared.entries[indexPath.row]
        
    }
}
