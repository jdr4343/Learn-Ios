//
//  TableCollectionViewCell.swift
//  AdvancedTableView
//
//  Created by 신지훈 on 2021/08/12.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TableCollectionViewCell"
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let myImageView: UIImage = {
        let image = UIImage() 
        return image
    }()
    
    //기능설정
    public func configure(with model: CollectionTableCellModel) {
        
    }
}
