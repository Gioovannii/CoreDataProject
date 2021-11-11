//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Giovanni Gaffé on 2021/11/10.
//
//

import Foundation
import CoreData

extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedValue: String {
        return title ?? "Unknown title"
    }
}

extension Movie : Identifiable {

}
