//
//  Entry+Convenience.swift
//  Journal but Core Data
//
//  Created by Gavin Craft on 4/26/21.
//

import CoreData

extension Entry{
    @discardableResult convenience init(title: String, detailText: String, timeStamp:Date = Date(), context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context:context)
        self.detailText = detailText
        self.title = title
        self.timestamp = timeStamp
    }
}
