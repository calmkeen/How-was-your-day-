//
//  InfoView.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import Foundation
import UIKit
import SwiftUI
import SnapKit

class InfoView: UIViewController{
    
    var InfoView: UIView = {
      let info = UIView()
        info.backgroundColor = .white
        return info
    }()
    
    enum SectionLayoutKind: Int, CaseIterable {
        case list, grid5, grid3
        var columnCount: Int {
            switch self {
            case .grid3:
                return 3

            case .grid5:
                return 5

            case .list:
                return 1
            }
        }
    }
    var dataSource: UICollectionViewDiffableDataSource<SectionLayoutKind, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSet()
        MakeView()
        Sizing()
    }

}

extension InfoView {
    
    func navigationItemSet(){
//        navigationItem.title = "InfomationView"
        navigationController?.isNavigationBarHidden = true
        navigationItem.largeTitleDisplayMode = .always
    }
    func MakeView(){
        view.addSubview(InfoView)
    }
    func Sizing(){
        InfoView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }
}

import SwiftUI

struct InfoViewPreview: PreviewProvider{
    
    static var previews: some View {
        InfoView().toPreview().previewInterfaceOrientation(.portraitUpsideDown)
        TabBarController().toPreview()
    }
}
