//
//  CurrencyListViewController.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import UIKit

class CurrencyListViewController: UIViewController {

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK: - LifeCycle

extension CurrencyListViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
//MARK: - VM -> VC
extension CurrencyListViewController: CurrencyListViewControllerProtocol{
    func goToCurrencyDetails(model: CurrencyModel) {
        //
    }
    
    
}
//MARK: - setupUI
extension CurrencyListViewController{
    
    
}
