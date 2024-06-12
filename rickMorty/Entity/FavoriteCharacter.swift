//
//  FavoriteCharacter.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 07/06/24.
//

import Foundation
import CoreData

@objc(FavoriteCharacter)
public class FavoriteCharacter: NSManagedObject, Identifiable {
    @NSManaged public var id: Int32
    @NSManaged public var name: String
    @NSManaged public var image: String
    @NSManaged public var race: String
}
