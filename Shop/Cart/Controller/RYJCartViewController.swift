//
//  RYJCartViewController.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/15.
//

import UIKit

class RYJCartViewController: RYJBaseViewController {

    lazy var discountView: RYJCartDiscountView = {
        let discountView = RYJCartDiscountView.init(frame: CGRect.zero)
        return discountView
    }()
    
    lazy var settlementView: RYJCartSettlementView = {
        let settlementView = RYJCartSettlementView.init(frame: CGRect.zero)
        return settlementView
    }()
    
    lazy var listView: RYJCartListView = {
        let listView = RYJCartListView.init(frame: CGRect.zero)
        return listView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "Cart"
        
        self.view.addSubview(discountView)
        discountView.snp.makeConstraints {
            $0.left.equalTo(self.view.snp.left).offset(20)
            $0.top.equalTo(self.titleLine.snp.bottom).offset(20)
            $0.right.equalTo(self.view.snp.right).offset(-20)
            $0.height.equalTo(80)
        }
        
        self.view.addSubview(settlementView)
        settlementView.snp.makeConstraints {
            $0.left.right.bottom.equalTo(self.view)
            $0.height.equalTo(60)
        }
        
        self.view.addSubview(listView)
        listView.snp.makeConstraints {
            $0.left.right.equalTo(self.view)
            $0.top.equalTo(discountView.snp.bottom).offset(10)
            $0.bottom.equalTo(settlementView.snp.top)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        listView.addDeleteButton()
    }
    
}
