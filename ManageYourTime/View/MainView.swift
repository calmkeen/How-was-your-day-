//
//  ViewController.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import UIKit
import SnapKit

class MainView: UIViewController, UICollectionViewDelegate {
    
    enum Section {
        case main
    }
    var selectedIndex : Int?
    
    var mainView = UIView()
    var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    //cell같은 부분이나 데이터를 관리할때 사용하는 코드
    //    var dataSource :UICollectionViewDiffableDataSource<<#SectionIdentifierType: Hashable#>, <#ItemIdentifierType: Hashable#>>
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewSizing()
        makeView()
        ConfigureNavItem()
        // Do any additional setup after loading the view.
    }
    //  * 앱 사용 중에 메모리가 부족할 때 불리는 메소드
    //  * 오랫동안 사용하지 않은 객체와 다시 쉽게 만들 수 있는 객체를 제거한다.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func makeView(){
        self.view.addSubview(mainView)
        mainView.addSubview(collectionView)
    }
    func configure(){
        
    }
    func ViewSizing(){
        mainView.snp.makeConstraints{ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        collectionView.snp.makeConstraints{ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MainView{
    
    func ConfigureNavItem() {
        navigationItem.title = "너 지금 뭐해?"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let leadingItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7),
                                                   heightDimension: .fractionalHeight(1.0)))
            leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            let trailingItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalHeight(0.3)))
            trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let trailingGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                                   heightDimension: .fractionalHeight(1.0)),
                subitem: trailingItem, count: 2)
            
            let nestedGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalHeight(0.4)),
                subitems: [leadingItem, trailingGroup])
            let section = NSCollectionLayoutSection(group: nestedGroup)
            return section
            
        }
        return layout
    }
    
    func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<MainView, Int> { (cell, indexPath, identifier) in
            // Populate the cell with our item description.
            cell.label.text = "\(indexPath.section), \(indexPath.item)"
            cell.contentView.backgroundColor = .cornflowerBlue
            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.cornerRadius = 8
            cell.label.textAlignment = .center
            cell.label.font = UIFont.preferredFont(forTextStyle: .title1)
        }
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            // Return the cell.
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
    }
}


import SwiftUI

struct MainViewPreview: PreviewProvider{
    static var previews: some View {
        MainView().toPreview()
        TabBarController().toPreview()
    }
}
