//
//  CompareView.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import Foundation
import UIKit

class CompareView: UIViewController{
    
    var CompareColView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSet()
        view.addSubview(CompareColView)
    }
}

extension CompareView {
    
    func navigationItemSet(){
        navigationController?.isNavigationBarHidden = true
        navigationItem.largeTitleDisplayMode = .always
    }
}
