//
//  EntryDetailViewController.swift
//  Journal but Core Data
//
//  Created by Gavin Craft on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    //MARK: - iboutlets
    @IBOutlet weak var titleTextView: UITextField!
    @IBOutlet weak var detailTextView: UITextView!
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - ibactions
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = titleTextView.text, !title.isEmpty,
              let details = detailTextView.text, !details.isEmpty else {return}
        if let entry = entry{
            entry.title = title
            entry.detailText = details
            EntryController.shared.updateEntry(entry)
        }else{
            EntryController.shared.createEntry(title: title, details: details)
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clearButtonPressed(_ sender: Any) {
        titleTextView.text = ""
        detailTextView.text = ""
    }
    
    //MARK: - instance vars
    var entry:Entry?
    
    //MARK: - func
    func updateViews(){
        guard let entry = entry else {return}
        titleTextView.text = entry.title
        detailTextView.text = entry.detailText
    }
    

}
