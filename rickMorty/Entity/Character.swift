//
//  Character.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 07/06/24.
//

import Foundation

struct Character: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let image: String
    let species: String
    let gender: String
    let status: String
    let created: String
}
