//
//  FocusChartCell.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/22.
//

import Foundation
import UIKit
import SnapKit

class FocusChartCell: UICollectionViewCell{
    
    static let reuseIdentifier = "FchartCell"
    
    var RecordTitle: UILabel = {
       let label = UILabel()
        return label
    }()
    var RecordImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    required init?(coder: NSCoder) {
      fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sizing()
        makeConst()
    }
    
}

extension FocusChartCell{
    func sizing(){
        self.contentView.addSubview(RecordImage)
        self.contentView.addSubview(RecordTitle)
    }
    func makeConst(){
        RecordImage.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        RecordTitle.snp.makeConstraints{ make in
            make.top.equalTo(RecordImage.snp.bottom)
        }
        
    }
}
