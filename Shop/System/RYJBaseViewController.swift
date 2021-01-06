//
//  RYJBaseViewController.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/15.
//

import UIKit

class RYJBaseViewController: UIViewController {

    lazy var iconButton: UIButton = {
        let icon = UIButton.init(type: UIButton.ButtonType.custom)
        icon.setImage(UIImage.init(named: "user_icon"), for: UIControl.State.normal)
        icon.frame = CGRect.init(x: 0, y: 0, width: 72, height: 72)
        return icon
    }()
    
    lazy var titleLine: UIView = {
        let line = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        line.backgroundColor = UIColor.hex(hexString: "0x979797")
        return line
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加用户icon
        iconButton.addTarget(self, action: #selector(iconButtonClick(sender:)), for: .touchUpInside)
        view.addSubview(iconButton)
        iconButton.snp.makeConstraints {
            $0.right.equalTo(self.view.snp.right).offset(-10)
            $0.top.equalTo(self.view.snp.top).offset(52)
        }
        
        // 添加分割线
        view.addSubview(titleLine)
        titleLine.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.top).offset(106)
            $0.left.equalTo(self.view.snp.left).offset(20)
            $0.right.equalTo(self.view.snp.right).offset(-20)
            $0.height.equalTo(1)
        }
        
        // 添加标题
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{
            $0.left.equalTo(titleLine.snp.left)
            $0.bottom.equalTo(titleLine.snp.top).offset(-10)
        }
    }
    
    @objc func iconButtonClick(sender: UIButton) {}
    
}
