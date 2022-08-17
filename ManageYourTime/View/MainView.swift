//
//  ViewController.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import UIKit
import SnapKit

class MainView: UIViewController {
    
    enum Section {
        case main
    }
    //    var selectedIndex : Int?
    
    //var mainView = UIView()
    //cell같은 부분이나 데이터를 관리할때 사용하는 코드
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collectionView: UICollectionView! = nil
    //        let collectionView = UICollectionView()
    //        collectionView.backgroundColor = .gray
    //        return collectionView
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewSizing()
        makeView()
        ConfigureNavItem()
        configureHierarchy()
        configureDataSource()
        // Do any additional setup after loading the view.
    }
    //  * 앱 사용 중에 메모리가 부족할 때 불리는 메소드
    //  * 오랫동안 사용하지 않은 객체와 다시 쉽게 만들 수 있는 객체를 제거한다.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func makeView(){
        //self.view.addSubview(mainView)
    }
    func configure(){
    }
    func ViewSizing(){
        //        mainView.snp.makeConstraints{ make in
        //            make.edges.equalTo(view.safeAreaLayoutGuide)
        //        }
        //        collectionView.snp.makeConstraints{ make in
        //            make.edges.equalTo(view.safeAreaLayoutGuide)
        //        }
    }
}

extension MainView{
    
    func ConfigureNavItem() {
        navigationController?.isNavigationBarHidden = true
        navigationItem.title = "너 지금 뭐해?"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
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
        
        let cellRegistration = UICollectionView.CellRegistration<TextCell, Int> { (cell, indexPath, identifier) in
            // Populate the cell with our item description.
            cell.label.text = "\(indexPath.section), \(indexPath.item)"
            cell.contentView.backgroundColor = .blue
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
        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(Array(0..<100))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}


import SwiftUI

struct MainViewPreview: PreviewProvider{
    static var previews: some View {
        MainView().toPreview().previewInterfaceOrientation(.portraitUpsideDown)
        TabBarController().toPreview()
    }
}
