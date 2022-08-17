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
        info.backgroundColor = .lightGray
        return info
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemSet()
        MakeView()
        Sizing()
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

extension InfoView {
    
    func navigationItemSet(){
//        navigationItem.title = "InfomationView"
        navigationController?.isNavigationBarHidden = true
        navigationItem.largeTitleDisplayMode = .always
    }
}


import SwiftUI

struct InfoViewPreview: PreviewProvider{
    static var previews: some View {
        InfoView().toPreview().previewInterfaceOrientation(.portraitUpsideDown)
        TabBarController().toPreview()
    }
}
