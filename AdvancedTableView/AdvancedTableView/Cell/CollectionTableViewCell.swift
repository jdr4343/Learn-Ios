//
//  CollectionTableViewCell.swift
//  AdvancedTableView
//
//  Created by 신지훈 on 2021/08/12.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    static let identifier = "CollectionTableViewCell"
    //컬렉션 뷰 생성 /이니셜라이저에서 설정
    private let collectionView: UICollectionView
    
    //컬렉션뷰가 사용할 모델에 대한 속성을 추가
    private var models = [CollectionTableCellModel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 170, height: 170)
        layout.sectionInset = UIEdgeInsets(top: 3,
                                           left: 3,
                                           bottom: 3,
                                           right: 3)
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        contentView.addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with models: [CollectionTableCellModel]) {
        self.models = models
        collectionView.reloadData()
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identifier, for: indexPath) as! TableCollectionViewCell
        return cell
    }
    //선택
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
}
