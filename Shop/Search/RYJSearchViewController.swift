//
//  RYJSearchViewController.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/15.
//

import UIKit

class RYJSearchViewController: RYJBaseViewController {

    lazy var searchTextField: UITextField = {
        let textField = UITextField.init()
        textField.placeholder = "  What are you looking for?"
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.backgroundColor = UIColor.hex(hexString: "0xF4F4F4")
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "Search"
        
        self.view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(self.titleLine.snp.bottom).offset(10)
            $0.left.equalTo(self.view.snp.left).offset(20)
            $0.right.equalTo(self.view.snp.right).offset(-20)
            $0.height.equalTo(40)
        }
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchTextField.endEditing(false)
    }
}
