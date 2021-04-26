//
//  EntryTableViewCell.swift
//  Journal but Core Data
//
//  Created by Gavin Craft on 4/26/21.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    //MARK: - iboutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK: - config
    func configure(entry:Entry){
        nameLabel.text = entry.title
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .short
        dateLabel.text = "\(dateformatter.string(from: entry.timestamp ?? Date()))"
    }

}
