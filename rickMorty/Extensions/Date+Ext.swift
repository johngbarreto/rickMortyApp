//
//  Date+Ext.swift
//  rickMorty
//
//  Created by João Gabriel Lavareda Ayres Barreto on 12/06/24.
//

import Foundation

extension String {
    func dateFromString(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: string) ?? Date()
    }
}
