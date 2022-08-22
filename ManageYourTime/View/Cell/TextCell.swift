//
//  TextCell.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/15.
//

import Foundation
import UIKit
import SnapKit

class TextCell: UICollectionViewCell{
    let label = UILabel()
    static let resueIdentifier = "textCell test"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        makeView()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemnted")
    }
}

extension TextCell {
    
    func configure(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        contentView.addSubview(label)
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
            ])
    }
    func makeView(){
        
    }
}
