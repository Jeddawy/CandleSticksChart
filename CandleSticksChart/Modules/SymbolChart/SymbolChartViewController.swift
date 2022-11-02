//
//  SymbolChartViewController.swift
//  CandleSticksChart
//
//  Created by Geddawy on 01/11/2022.
//

import UIKit
import Charts

class SymbolChartViewController: UIViewController {

    @IBOutlet weak var chartView: CandleStickChartView!
    private var viewModel: SymbolChartViewModelProtocol!
    //MARK: - Public Methods
    class func create(model: ChartDataResponse, title: String) -> SymbolChartViewController {
        let VC: SymbolChartViewController = UIViewController.create(storyboardName: "Main", identifier: "\(SymbolChartViewController.self)")
        VC.viewModel = SymbolChartViewModel(view: VC, model: model, title: title)
        return VC
    }
}

//MARK: - Life Cycle
extension SymbolChartViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.setup()
        setupChart()

    }
    
}

extension SymbolChartViewController: SymbolChartViewControllerProtocol{
   
    func getData(_ dateset: [Item], title: String) {
        self.title = title
        let yVals1 = dateset.enumerated().map { (index,i) -> CandleChartDataEntry in
            let vall = i.array[3].toDouble() ?? 0
            let highh = i.array[2].toDouble() ?? 0
            let loww = i.array[3].toDouble() ?? 0
            let openn = i.array[1].toDouble() ?? 0
            let closee = i.array[1].toDouble() ?? 0
            let val = Double(Double(arc4random_uniform(40)) + vall)
            let high = Double(Double(arc4random_uniform(9)) + highh)
            let low = Double(Double(arc4random_uniform(9)) + loww)
            let open = Double(Double(arc4random_uniform(6)) + openn)
            let close = Double(Double(arc4random_uniform(6)) + closee)
            print(val, high, low, open, close , "chart data")
            return CandleChartDataEntry(x: Double(index), shadowH: high, shadowL: low, open: open , close: close , icon: UIImage())
        }
        
        let set = CandleChartDataSet(entries: yVals1, label: "Data Set")
        set.axisDependency = .right
        set.setColor(UIColor(white: 80/255, alpha: 1))
        set.drawIconsEnabled = false
        set.shadowColor = .darkGray
        set.shadowWidth = 0.7
        set.shadowColorSameAsCandle = true
        set.decreasingColor = UIColor(named: "redColor")
        set.decreasingFilled = true
        set.increasingColor = UIColor(named: "blueColor")
        set.increasingFilled = true
        set.neutralColor = .blue
        chartView.rightAxis.axisMinimum = (set.yMin) * 0.8// to make minimum value not zero
        chartView.rightAxis.axisMaximum = set.yMax * 1.2
        let data = CandleChartData(dataSet: set)
        chartView.data = data
    }
}
extension SymbolChartViewController: ChartViewDelegate {

    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(chartView.data?.yMax, chartView.data?.yMin)
    }
    
    func chartValueNothingSelected(_ chartView: ChartViewBase) {
    }
    
    func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {
        
    }
    
    func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
        
    }
}

//MARK: - Setup UI
extension SymbolChartViewController{
   private func setupChart(){
        chartView.delegate = self
        chartView.roundCorner([.allCorners], radius: 10)
        chartView.chartDescription.enabled = false
        chartView.drawMarkers = true
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.maxVisibleCount = 10
        chartView.pinchZoomEnabled = true
        chartView.legend.horizontalAlignment = .right
        chartView.legend.verticalAlignment = .top
        chartView.legend.orientation = .vertical
        chartView.legend.drawInside = false
        chartView.legend.font = UIFont(name: "HelveticaNeue-Light", size: 10)!
        chartView.rightAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10)!
        chartView.rightAxis.labelTextColor = .white
        chartView.rightAxis.spaceTop = 0.3
        chartView.rightAxis.spaceBottom = 0.3
//        chartView.rightAxis.axisMinimum = 0
        chartView.leftAxis.enabled = false
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelTextColor = .white
//       chartView.xAxis.labelCount = 8
       chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 10)!
        chartView.backgroundColor = UIColor(named: "secondryColor")
    }
}
