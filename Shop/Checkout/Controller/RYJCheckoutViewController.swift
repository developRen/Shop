//
//  RYJCheckoutViewController.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/30.
//

import UIKit

class RYJCheckoutViewController: RYJBaseViewController {

    lazy var closeButton: UIButton = {
        let button = UIButton.init(frame: CGRect.init(x: screenWidth - 20 - 28, y: 53, width: 28, height: 28))
        button.setImage(UIImage.init(named: "basel_close"), for: UIControl.State.normal)
        return button
    }()
    
    lazy var progressView: RYJCheckoutProgressView = {
        let progressView = RYJCheckoutProgressView.init(frame: CGRect.zero)
        return progressView
    }()
    
    lazy var nextView: RYJCartSettlementView = {
        let nextView = RYJCartSettlementView.init(frame: CGRect.zero)
        nextView.priceLabel.isHidden = false
        nextView.settlementButton .setTitle("Next", for: UIControl.State.normal)
        return nextView
    }()
    
    lazy var shipmentView: RYJCheckoutShipmentView = {
        let shipmentView = RYJCheckoutShipmentView.init(frame: CGRect.zero)
        return shipmentView
    }()
    
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .white
        iconButton.isHidden = true
        titleLabel.text = "Checkout"
        
        closeButton.addTarget(self, action: #selector(closeButtonClick), for: .touchUpInside)
        self.view.addSubview(closeButton)
        
        self.view.addSubview(progressView)
        progressView.snp.makeConstraints {
            $0.left.right.equalTo(self.view)
            $0.top.equalTo(titleLine.snp.bottom)
            $0.height.equalTo(80)
        }
        
        nextView.settlementClickBlock = { [weak self] in
            self!.index += 1
            if self!.index == 3 {
                self!.index = 0
            }
            self!.progressView.next(self!.index)
        }
        self.view.addSubview(nextView)
        nextView.snp.makeConstraints {
            $0.left.right.equalTo(self.view)
            $0.bottom.equalTo(self.view.snp.bottom).offset(-44)
            $0.height.equalTo(60)
        }
        
        self.view.addSubview(shipmentView)
        shipmentView.snp.makeConstraints {
            $0.left.right.equalTo(self.view)
            $0.top.equalTo(progressView.snp.bottom)
            $0.bottom.equalTo(nextView.snp.top)
        }
    }

    @objc func closeButtonClick(sender: UIButton) {
        self.dismiss(animated: true) {}
    }
    
}
