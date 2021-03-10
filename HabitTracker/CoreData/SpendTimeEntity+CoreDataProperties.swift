//
//  SpendTimeEntity+CoreDataProperties.swift
//  
//
//  Created by Valentin Mille on 10/03/2021.
//
//

import Foundation
import CoreData


extension SpendTimeEntity: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SpendTimeEntity> {
        return NSFetchRequest<SpendTimeEntity>(entityName: "SpendTimeEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var date: Date
    @NSManaged public var minutes: Int64

}
