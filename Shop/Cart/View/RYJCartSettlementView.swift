//
//  RYJCartSettlementView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/18.
//

import UIKit

class RYJCartSettlementView: UIView {

    lazy var line: UIView = {
        let line = UIView.init(frame: CGRect.zero)
        line.backgroundColor = UIColor.hex(hexString: "0xE9E9E9")
        return line
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Total price"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "VAT included"
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var settlementButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.hex(hexString: "0x2F69F8")
        button.frame = CGRect.zero
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.setTitle("$ 0", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(settlementButtonClick), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    typealias settlementBlock = () ->()
    var settlementClickBlock: settlementBlock!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(line)
        line.snp.makeConstraints {
            $0.left.top.right.equalTo(self)
            $0.height.equalTo(1)
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(self.snp.top).offset(8.5)
        }
        
        self.addSubview(contentLabel)
        contentLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(5)
        }
        
        self.addSubview(settlementButton)
        settlementButton.snp.makeConstraints {
            $0.right.equalTo(self.snp.right).offset(-20)
            $0.centerY.equalTo(self.snp.centerY)
            $0.width.equalTo(90)
            $0.height.equalTo(40)
        }
        
    }
    
    @objc func settlementButtonClick() {
        if let _ = settlementClickBlock {
            self.settlementClickBlock()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
