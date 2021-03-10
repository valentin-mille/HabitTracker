//
//  HabitEntity+CoreDataProperties.swift
//  
//
//  Created by Valentin Mille on 09/03/2021.
//
//

import Foundation
import CoreData


extension HabitEntity: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitEntity> {
        return NSFetchRequest<HabitEntity>(entityName: "HabitEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var stringDescription: String
    @NSManaged public var imageUrl: URL?
    @NSManaged public var isFavorite: Bool

}
