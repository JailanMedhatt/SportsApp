//
//  Date.swift
//  SportsApp
//
//  Created by Iman Mahmoud on 04/06/2025.
//

import UIKit

extension Date {
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func nextYear() -> Date {
        return Calendar.current.date(byAdding: .year, value: 1, to: self)!
    }
    
    func lastYear() -> Date {
        return Calendar.current.date(byAdding: .year, value: -1, to: self)!
    }
}
