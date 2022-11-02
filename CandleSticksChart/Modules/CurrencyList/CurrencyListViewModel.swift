//
//  CurrencyListViewModel.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import Foundation

class CurrencyListViewModel{
    private weak var view: CurrencyListViewControllerProtocol!
    private var list: [CurrencyModel] = [CurrencyModel(title: "BTC", navgiationTitle: "BTC/USDT", symbol: "BTCUSDT", limit: "100", interval: "15m")
    ,CurrencyModel(title: "LTC", navgiationTitle: "LTC/USDT", symbol: "LTCUSDT", limit: "100", interval: "15m")
    ,CurrencyModel(title: "ETH", navgiationTitle: "ETH/USDT", symbol: "ETHUSDT", limit: "100", interval: "15m")]
    init(view: CurrencyListViewControllerProtocol!) {
        self.view = view
    }
}

extension CurrencyListViewModel: CurrencyListViewModelProtocol{
    func getItem(at index: Int) -> CurrencyModel {
        return list[index]
    }
    
    func itemsCount() -> Int {
        return list.count
    }
    
    func didTapItem(at index: Int) {
        let item = self.getItem(at: index)
        self.getSymboleChartData(symbol: item.symbol, interval: item.interval, limit: item.limit)
    }
    
}

extension CurrencyListViewModel{
    private func getSymboleChartData(symbol: String, interval: String, limit: String){
        self.view?.showLoader()
        APIManager.currencyDate(symbole: symbol, interval: interval, limit: limit){ response ,code in
            switch response {
            case .success(let success):
                if code == 200{
                    self.view.goToCurrencyDetails(model: success)
                }else{
                    self.view.showError("There is an error")
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                self.view.showError("Something went wrong, please try again later")
            }
        }
        self.view?.hideLoader()
    }
}
