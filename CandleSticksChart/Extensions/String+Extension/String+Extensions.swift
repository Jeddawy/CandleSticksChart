//
//  String+Extensions.swift
//  CandleSticksChart
//
//  Created by Geddawy on 02/11/2022.
//

import Foundation
extension String {
    func toDouble() -> Double? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en")
        let double = formatter.number(from: self)?.doubleValue
        return double
    }
}
