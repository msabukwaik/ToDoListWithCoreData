//
//  Note+CoreDataProperties.swift
//  ToDoListWithCoreData
//
//  Created by Mohammed S A Kwaik on 10/9/17.
//  Copyright © 2017 Mohammed S A Kwaik. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var note_title: String?
    @NSManaged public var note_description: String?

}
