//
//  Card.swift
//  Rewardy
//
//  Created by Mengxi Chen on 8/12/22.
//

import Foundation
import UIKit

struct Card {
    let name: String
    let seasonBool: Bool
    var season: String {
        if seasonBool == true {
            let date = Date()
            let calendar = Calendar.current
            let month = calendar.component(.month, from: date)
            switch month {
            case 1...3:
                return "Jan. - Mar."
            case 4...6:
                return "Apr. - Jun."
            case 7...9:
                return "Jul. - Sep."
            default:
                return "Oct. - Dec."
            }
        } else {
            return "All Year"
        }
    }
    
    let reward: String
    
}


