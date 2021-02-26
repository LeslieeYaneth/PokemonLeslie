//
//  Favorites+CoreDataProperties.swift
//  
//
//  Created by Lesliee Yaneth on 25/02/21.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var imagePokemon: String?
    @NSManaged public var namePokemon: String?

}
