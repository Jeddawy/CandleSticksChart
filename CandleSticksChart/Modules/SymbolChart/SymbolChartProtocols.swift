//
//  SymbolChartProtocols.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import Foundation
import Charts

protocol SymbolChartViewControllerProtocol: AnyObject{
    func getData(_ dateset: [Item], title: String)
}

protocol SymbolChartViewModelProtocol{
    func setup()
}

struct Item : Decodable {
    var array = [String]()

    init(from decoder: Decoder) throws {
        var arrayContainer = try decoder.unkeyedContainer()
        while !arrayContainer.isAtEnd {
            if let string = try? arrayContainer.decode(String.self){
                array.append(string)
            }
            if let int = try? arrayContainer.decode(Int.self){
                array.append(String(int))
            }
        }
    }
}

