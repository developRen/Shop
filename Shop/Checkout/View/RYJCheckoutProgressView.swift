//
//  RYJCheckoutProgressView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/30.
//

import UIKit

class RYJCheckoutProgressView: UIView {

    lazy var backgroundView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 20, y: 20, width: screenWidth - 40, height: 40))
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = .hex(hexString: "0xF8F8F8")
        return view
    }()
    
    lazy var tagView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: (screenWidth - 40) / 3, height: 40))
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.backgroundColor = .hex(hexString: "0xFFB701")
        return view
    }()
    
    lazy var shipmentLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: (screenWidth - 40) / 3, height: 40))
        label.text = "Shipment"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var paymentLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: (screenWidth - 40) / 3, y: 0, width: (screenWidth - 40) / 3, height: 40))
        label.text = "Payment"
        label.textColor = .hex(hexString: "0x6A6A6A")
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var summaryLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: (screenWidth - 40) / 3 * 2, y: 0, width: (screenWidth - 40) / 3, height: 40))
        label.text = "Summary"
        label.textColor = .hex(hexString: "0x6A6A6A")
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(tagView)
        
        backgroundView.addSubview(shipmentLabel)
        backgroundView.addSubview(paymentLabel)
        backgroundView.addSubview(summaryLabel)
    }
    
    func next(_ index: Int) {
        switch index {
        case 0: do {
            UIView.animate(withDuration: 0.25) { [self] in
                self.tagView.frame = CGRect.init(x: 0, y: 0, width: (screenWidth - 40) / 3, height: 40)
                self.paymentLabel.textColor = .hex(hexString: "0x6A6A6A")
                self.summaryLabel.textColor = .hex(hexString: "0x6A6A6A")
            } completion: {_ in
                self.shipmentLabel.textColor = .white
            }
        }
        case 1: do {
            UIView.animate(withDuration: 0.25) { [self] in
                self.tagView.frame = CGRect.init(x: (screenWidth - 40) / 3, y: 0, width: (screenWidth - 40) / 3, height: 40)
                self.shipmentLabel.textColor = .hex(hexString: "0x6A6A6A")
                self.summaryLabel.textColor = .hex(hexString: "0x6A6A6A")
            } completion: { _ in
                self.paymentLabel.textColor = .white
            }
        }
        case 2: do {
            UIView.animate(withDuration: 0.25) { [self] in
                self.tagView.frame = CGRect.init(x: (screenWidth - 40) / 3 * 2, y: 0, width: (screenWidth - 40) / 3, height: 40)
                self.shipmentLabel.textColor = .hex(hexString: "0x6A6A6A")
                self.paymentLabel.textColor = .hex(hexString: "0x6A6A6A")
            } completion: { _ in
                self.summaryLabel.textColor = .white
            }
        }
        default: break
            
        }
    }
    
}
