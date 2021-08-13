//
//  ViewController.swift
//  Graph
//
//  Created by 신지훈 on 2021/08/13.
//

import UIKit
import Charts

class BarViewController: UIViewController, ChartViewDelegate {
    
    //차트생성
    var barChart = BarChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //프레임 설정
        barChart.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.size.width,
                                height: self.view.frame.size.width)
        //중심잡기
        barChart.center = view.center
        //서브 뷰 추가
        view.addSubview(barChart)
        
        //차트에 대한 일부 데이터 설정
        var entries = [BarChartDataEntry]()
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        }
        //위에서 만든 entries를 set에 저장하고 프레임워크에서 지원하는 템플릿 사용
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        //set을 data로 저장 한후 값 전달
        let data = BarChartData(dataSet: set)
        barChart.data = data
        
        
    }

}

