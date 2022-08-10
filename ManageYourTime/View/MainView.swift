//
//  ViewController.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import UIKit
import SnapKit

class MainView: UIViewController {
    
    var selectedIndex : Int?

    
    var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .gray
        return collectionView
    }()
    //cell같은 부분이나 데이터를 관리할때 사용하는 코드
//    var dataSource :UICollectionViewDiffableDataSource<<#SectionIdentifierType: Hashable#>, <#ItemIdentifierType: Hashable#>>
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //  * 앱 사용 중에 메모리가 부족할 때 불리는 메소드
    //  * 오랫동안 사용하지 않은 객체와 다시 쉽게 만들 수 있는 객체를 제거한다.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func makeView(){
        self.view.addSubview(mainCollectionView)
    }
    func configure(){
        
    }
    func ViewSizing(){
        mainCollectionView.snp.makeConstraints{make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MainView{
    
    func ConfigureNavItem() {
        navigationItem.title = "너 지금 뭐해?"
        navigationItem.largeTitleDisplayMode = .always
    }
    
}


import SwiftUI

struct MainViewPreview: PreviewProvider{
    static var previews: some View{
        MainView().toPreview()
        TabBarController().toPreview()
    }
}
