//
//  EntryController.swift
//  Journal but Core Data
//
//  Created by Gavin Craft on 4/26/21.
//

import CoreData
class EntryController{
    //MARK: - proplerties
    static let shared = EntryController()
    var entries:[Entry] = []
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    
    //MARK: - crud functions
    func createEntry(title:String, details:String, timestamp:Date = Date()){
        entries.append(Entry(title: title, detailText: details, timeStamp: timestamp))
        CoreDataStack.saveContext()
    }
    func fetchEntries(){
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(entries.count)
        self.entries = entries
    }
    func updateEntry(_ entry: Entry){
        CoreDataStack.saveContext()
    }
    func deleteEntry(entry:Entry){
        guard let index = entries.firstIndex(of: entry) else {return}
        entries.remove(at: index)
        CoreDataStack.saveContext()
    }
}
