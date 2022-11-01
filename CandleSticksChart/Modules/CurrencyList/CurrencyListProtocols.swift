//
//  CurrencyListProtocols.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import Foundation

protocol CurrencyListViewControllerProtocol: AnyObject{
    func goToCurrencyDetails(model: CurrencyModel)
}

protocol CurrencyListViewModel{
    func getItem(at index: Int)-> CurrencyModel
    func itemsCount()-> Int
    func didTapItem(at index: Int)
}

struct CurrencyModel{
    let title: String
    let navgiationTitle: String
    let symbol: String
    let limit: String
    let interval: String
}
