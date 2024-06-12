//
//  CharacterEntity+CoreDataProperties.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 12/06/24.
//
//

import Foundation
import CoreData


extension CharacterEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterEntity> {
        return NSFetchRequest<CharacterEntity>(entityName: "CharacterEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var race: String?
    @NSManaged public var status: String?
    @NSManaged public var gender: String?
    @NSManaged public var created: String?


}

extension CharacterEntity : Identifiable {

}
