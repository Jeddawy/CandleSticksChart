//
//  CurrencyListViewController.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import UIKit

class CurrencyListViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tableview: UITableView!
    
    //MARK: - Constants
    let tableviewHieght: CGFloat = 44
    
    //MARK: - Variables
    var viewModel: CurrencyListViewModelProtocol!
    
}

//MARK: - LifeCycle
extension CurrencyListViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setupTableview()
    }
    
}

//MARK: - VM -> VC
extension CurrencyListViewController: CurrencyListViewControllerProtocol{

    func goToCurrencyDetails(model: ChartDataResponse, title: String) {
        let vc = SymbolChartViewController.create(model: model, title: title)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showLoader() {
        self.view?.showLoader()
    }
    
    func hideLoader() {
        self.view?.hideLoader()
    }
    
    func showError(_ message: String) {
        showAlert(message: message)
    }
    
}

//MARK: - talbeview delegation
extension CurrencyListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.ID, for: indexPath) as? CurrencyTableViewCell else {return UITableViewCell()}
        cell.configure(model: viewModel.getItem(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didTapItem(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableviewHieght
    }
}

//MARK: - setupUI
extension CurrencyListViewController{
    private func setupTableview(){
        tableview.delegate  = self
        tableview.dataSource = self
        let nib = UINib(nibName: CurrencyTableViewCell.ID, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: CurrencyTableViewCell.ID)
        tableview.roundCorner([.allCorners], radius: 10)
        setupNavigtationTitle()
    }
    private func setupNavigtationTitle(){
        self.title = "Symbols"
    }
    private func setupViewModel(){
        self.viewModel = CurrencyListViewModel(view: self)
    }
}
