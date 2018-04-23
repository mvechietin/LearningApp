//
//  Photo+CoreDataProperties.swift
//  
//
//  Created by Matheus Gustavo dos Santos Vechietin on 22/04/2018.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var author: String?
    @NSManaged public var mediaURL: String?
    @NSManaged public var tags: String?

}
