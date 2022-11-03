//
//  SymbolChartViewModel.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import Foundation
import Charts
import UIKit
class SymbolChartViewModel{
    
    private weak var view: SymbolChartViewControllerProtocol!
    private var model: ChartDataResponse!
    private var title: String
    private var arr = [Item]()
    init(view: SymbolChartViewControllerProtocol, model: ChartDataResponse, title: String) {
        self.view = view
        self.title = title
        self.model = model
        AnalyticsEventsManager.shared().track(event: title)//Log event with name of Symbol
    }

}

//MARK: - VC -> VM
extension SymbolChartViewModel: SymbolChartViewModelProtocol{
    func setup() {
        self.setDataCount()
    }
}
//MARK: - Logic
extension SymbolChartViewModel{
    func setDataCount() {
        let jsonData = encodeToJSON(model)
        do {
            let result = try JSONDecoder().decode([Item].self, from: jsonData!)
            arr = result
        } catch {
            print(error)
        }
        self.view.getData(arr, title: title)
    }
    
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}
