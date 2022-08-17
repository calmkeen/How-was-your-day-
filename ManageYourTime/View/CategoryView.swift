//
//  CategoryView.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import Foundation
import UIKit
import SnapKit


class CategoryView: UIViewController{
    
    var cateColView: UIView = {
        let colView = UIView()
        colView.backgroundColor = .lightGray
        return colView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSet()
        makeView()
        sizing()
    }
}

extension CategoryView {
    
    func navigationItemSet(){
//        navigationItem.title = "CategoryView"
        navigationController?.isNavigationBarHidden = true
        navigationItem.largeTitleDisplayMode = .always
        
    }
    func makeView(){
        view.addSubview(cateColView)
    }
    func sizing(){
        cateColView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


import SwiftUI
