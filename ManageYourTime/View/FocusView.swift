//
//  FocusView.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import Foundation
import UIKit
import SnapKit

class FocusView: UIViewController{

    var focusColView: UIView = {
        let focusView = UIView()
        focusView.backgroundColor = .darkGray
        return focusView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSet()
        makeView()
        sizing()
        navigationController?.isNavigationBarHidden = true
    }
    
}

extension FocusView {
    
    func navigationItemSet(){
//        navigationItem.title = "집중 시간"
        navigationController?.isNavigationBarHidden = true
        navigationItem.largeTitleDisplayMode = .always
    }
    func sizing(){
        focusColView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func makeView(){
        view.addSubview(focusColView)
    }
    
    
    
}
