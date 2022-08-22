//
//  FocusView.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import Foundation
import UIKit
import SnapKit
import SwiftUI

class FocusView: UIViewController{
    
    enum Section : Int{
        case focusTime = 0,targetTime
        func description() -> String {
            switch self {
            case .focusTime:
                return "집중 시간"
            case .targetTime:
                return "목표 시간"
            }
        }
        func secondaryDescription() -> String {
            switch self {
            case .focusTime:
                return "집중중인 시간을 나타내줍니다."
            case .targetTime:
                return "총 집중해야 하는 시간을 알려줍니다."
            }
        }
    }
    typealias SectionType = Section
    //가데이터 넣어봐야함
    typealias ItemType = foucsTimeModel//MountainsController.Mountain
    
    
    var focusColView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: getLayout())
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.scrollIndicatorInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 4)
        view.contentInset = .zero
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.register(FocusChartCell.self, forCellWithReuseIdentifier: "FcharCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var foucsBtn: UISwitch = {
        let btn = UISwitch()
        btn.backgroundColor = .white
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSet()
        makeView()
        sizing()
        navigationController?.isNavigationBarHidden = true
        //foucsBtn.addTarget(self, action: #selector(printLog(_:)), for: .touchUpInside)
    }
    
}

extension FocusView {
    
    static func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                let itemFractionalWidthFraction = 1.0 / 3.0 // horizontal 3개의 셀
                let groupFractionalHeightFraction = 1.0 / 4.0 // vertical 4개의 셀
                let itemInset: CGFloat = 2.5
                
                // Item
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                
                // Group
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(groupFractionalHeightFraction)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                return section
            default:
                let itemFractionalWidthFraction = 1.0 / 5.0 // horizontal 5개의 셀
                let groupFractionalHeightFraction = 1.0 / 4.0 // vertical 4개의 셀
                let itemInset: CGFloat = 2.5
                
                // Item
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                
                // Group
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(groupFractionalHeightFraction)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                return section
                
            }
        }
    }
    
    func navigationItemSet(){
        //        navigationItem.title = "집중 시간"
        navigationController?.isNavigationBarHidden = true
        navigationItem.largeTitleDisplayMode = .always
    }
    func sizing(){
        focusColView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        foucsBtn.snp.makeConstraints{ make in
            make.right.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func makeView(){
        view.addSubview(focusColView)
        focusColView.addSubview(foucsBtn)
    }
    
    @objc func btnSwitch(){
        
    }
    
}
