//
//  ViewController.swift
//  ManageYourTime
//
//  Created by calmkeen on 2022/08/08.
//

import UIKit
import SnapKit

class Mainview: UIViewController {
    
    
    var list1: UIView = {
        let list1: UIView()
        list1.backgroundColor = .gray
        return list1
    }()
    var selectedIndex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func makeView(){
        self.view.addSubview(list1)
    }
    func configure(){
        
    }
    func ViewSizing(){
        list1.snp.makeConstraints{make in
            make.edges.equalTo()
        }
        
    }
    
}

