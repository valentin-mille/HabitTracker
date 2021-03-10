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
    @NSManaged public var timeSlots: NSSet?
    
    func totalMinutesSpend() -> Int {
        guard let timeSlots = timeSlots else { return 0 }
        guard let values = Array(timeSlots) as? [SpendTimeEntity] else { return 0 }
        return values.map { Int($0.minutes) }.reduce(0, +)
    }
    
    func spendTimes() -> [SpendTimeEntity] {
        if let timeSlots = timeSlots {
            return Array(timeSlots) as! [SpendTimeEntity]
        } else {
            return [SpendTimeEntity]()
        }
    }
}

// MARK: Generated accessors for timeSlots
extension HabitEntity {

    @objc(addTimeSlotsObject:)
    @NSManaged public func addToTimeSlots(_ value: SpendTimeEntity)

    @objc(removeTimeSlotsObject:)
    @NSManaged public func removeFromTimeSlots(_ value: SpendTimeEntity)

    @objc(addTimeSlots:)
    @NSManaged public func addToTimeSlots(_ values: NSSet)

    @objc(removeTimeSlots:)
    @NSManaged public func removeFromTimeSlots(_ values: NSSet)

}

