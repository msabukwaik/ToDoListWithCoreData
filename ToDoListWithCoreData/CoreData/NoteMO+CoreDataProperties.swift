//
//  NoteMO+CoreDataProperties.swift
//  ToDoListWithCoreData
//
//  Created by Mohammed S A Kwaik on 10/10/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//
//

import Foundation
import CoreData


extension NoteMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteMO> {
        return NSFetchRequest<NoteMO>(entityName: "Note")
    }

    @NSManaged public var note_title: String?
    @NSManaged public var note_description: String?

}
