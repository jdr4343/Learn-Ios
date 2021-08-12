//
//  ViewController.swift
//  AdvancedTableView
//
//  Created by 신지훈 on 2021/08/12.
//

import UIKit

class ViewController: UIViewController {

    //테이블 뷰 생성
    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        //셀 등록
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    //모델 호출
    private var models = [CellModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpModels()
        
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    //모델 파일에서 설정해준 모델을 선택하고 설정
    private func setUpModels() {
        models.append(.collectionView(models: [CollectionTableCellModel(title: "Food 1", imageName: "food1"),
                                               CollectionTableCellModel(title: "Food 2", imageName: "food2"),
                                               CollectionTableCellModel(title: "Food 3", imageName: "food3"),
                                               CollectionTableCellModel(title: "Food 4", imageName: "food4"),
                                               CollectionTableCellModel(title: "Food 5", imageName: "food5"),
                                               CollectionTableCellModel(title: "Food 6", imageName: "food6"),
                                               CollectionTableCellModel(title: "Food 7", imageName: "food7")],rows: 2))
        models.append(.list(models: [ListCellModel(title: "First thing"),
                                     ListCellModel(title: "Second thing"),
                                     ListCellModel(title: "Another thing"),
                                     ListCellModel(title: "Other thing"),
                                     ListCellModel(title: "More thing"),
                                     ]))
    }
    
    


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //모델 배열의 행 반환
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .list(let models):
            return models.count
        case .collectionView(let models, _):
            return models.count
        }
    }
    //셀 위치
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .list(let models):
            let model = models[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = model.title
            return cell
            
        case .collectionView(let models, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
            cell.configure(with: models)
            return cell
        }
        
        
       
     
    }
    //셀 클릭
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //셀높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
