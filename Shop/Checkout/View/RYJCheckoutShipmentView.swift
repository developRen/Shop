//
//  RYJCheckoutShipmentView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/30.
//

import UIKit

class RYJCheckoutShipmentView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Delivery address"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var line1: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 20, y: 40, width: screenWidth - 40, height: 1))
        view.backgroundColor = .hex(hexString: "0xEDEDED")
        return view
    }()
    
    lazy var line2: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 20, y: 176, width: screenWidth - 40, height: 1))
        view.backgroundColor = .hex(hexString: "0xEDEDED")
        return view
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        let str = "Gauthier Drewitt\n7303 W Alexander Rd\nLas Vegas, NV 89129\nUSA"
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = 13
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13),
                          NSAttributedString.Key.paragraphStyle: paraph]
        label.attributedText = NSAttributedString(string: str, attributes: attributes)
        label.textColor = .hex(hexString: "0x222222")
        label.numberOfLines = 0
        return label
    }()
    
    lazy var newAddressLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "New address"
        label.textColor = .hex(hexString: "#222222")
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var addressButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage.init(named: "address_unselected"), for: UIControl.State.normal)
        button.setImage(UIImage.init(named: "address_selected"), for: UIControl.State.selected)
        button.isSelected = true
        return button
    }()
    
    lazy var newAddressButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.setImage(UIImage.init(named: "address_unselected"), for: UIControl.State.normal)
        button.setImage(UIImage.init(named: "address_selected"), for: UIControl.State.selected)
        button.isSelected = false
        return button
    }()
    
    lazy var freeButton: RYJCheckoutFreightView = {
        let button = RYJCheckoutFreightView.init(type: UIButton.ButtonType.custom)
        button.iconImageView.image = UIImage.init(named: "checkout_track_1")
        button.shipmentLabel.text = "Free shipment"
        button.timeLabel.text = "Free shipment over 100€\nDeliver time 2-3 days"
        button.priceLabel.text = "$ 0"
        button.isSelected = true
        return button
    }()
    
    lazy var premiumButton: RYJCheckoutFreightView = {
        let button = RYJCheckoutFreightView.init(type: UIButton.ButtonType.custom)
        button.iconImageView.image = UIImage.init(named: "checkout_track_2")
        let shipmentStr = "Get premium shipment"
        let shipmentAttrStr = NSMutableAttributedString.init(string: shipmentStr)
        shipmentAttrStr.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.hex(hexString: "0x2F69F8"), range:NSRange.init(location:4, length: 7))
        button.shipmentLabel.attributedText = shipmentAttrStr
        
        let timeStr = "Deliver time 24h"
        let timeAttrStr = NSMutableAttributedString.init(string: timeStr)
        timeAttrStr.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor.hex(hexString: "0x2F69F8"), range:NSRange.init(location:13, length: 3))
        button.timeLabel.attributedText = timeAttrStr
        button.priceLabel.text = "$ 30"
        button.isSelected = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(self.snp.top).offset(10)
        }
        
        self.addSubview(line1)
        self.addSubview(line2)

        self.addSubview(addressLabel)
        addressLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(line1.snp.bottom)
            $0.bottom.equalTo(line2.snp.top)
        }
        
        self.addSubview(newAddressLabel)
        newAddressLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(line2.snp.bottom)
            $0.height.equalTo(54)
        }
        
        addressButton.addTarget(self, action: #selector(addressButtonClick(sender:)), for: .touchUpInside)
        self.addSubview(addressButton)
        addressButton.snp.makeConstraints {
            $0.centerY.equalTo(addressLabel.snp.centerY)
            $0.right.equalTo(self.snp.right).offset(-20)
            $0.height.width.equalTo(24)
        }
        
        newAddressButton.addTarget(self, action: #selector(newAddressButtonClick(sender:)), for: .touchUpInside)
        self.addSubview(newAddressButton)
        newAddressButton.snp.makeConstraints {
            $0.centerY.equalTo(newAddressLabel.snp.centerY)
            $0.right.equalTo(self.snp.right).offset(-20)
            $0.height.width.equalTo(24)
        }
        
        freeButton.addTarget(self, action: #selector(freeButtonClick(sender:)), for: .touchUpInside)
        self.addSubview(freeButton)
        freeButton.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(newAddressLabel.snp.bottom).offset(20)
            $0.right.equalTo(self.snp.right).offset(-20)
            $0.height.equalTo(80)
        }
        
        premiumButton.addTarget(self, action: #selector(premiumButtonClick(sender:)), for: .touchUpInside)
        self.addSubview(premiumButton)
        premiumButton.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(freeButton.snp.bottom).offset(20)
            $0.right.equalTo(self.snp.right).offset(-20)
            $0.height.equalTo(80)
        }
    }
    
    @objc func addressButtonClick(sender: UIButton) {
        addressButton.isSelected = true
        newAddressButton.isSelected = false
    }
    
    @objc func newAddressButtonClick(sender: UIButton) {
        addressButton.isSelected = false
        newAddressButton.isSelected = true
    }
    
    @objc func freeButtonClick(sender: UIButton) {
        freeButton.isSelected = true
        premiumButton.isSelected = false
    }
    
    @objc func premiumButtonClick(sender: UIButton) {
        freeButton.isSelected = false
        premiumButton.isSelected = true
    }
}

class RYJCheckoutFreightView: UIButton {
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        return imageView
    }()
    
    lazy var shipmentLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.textColor = .hex(hexString: "0x6A6A6A")
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.textColor = .hex(hexString: "0x2F69F8")
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var checkImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.image = UIImage.init(named: "freight_select")
        return imageView
    }()
    
    override var isSelected: Bool {
        willSet {
            
        }
        
        didSet {
            if isSelected {
                self.layer.borderColor = UIColor.hex(hexString: "0xFFB701").cgColor
                checkImageView.isHidden = false
            } else {
                self.layer.borderColor = UIColor.hex(hexString: "0xE4E4E4").cgColor
                checkImageView.isHidden = true
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .hex(hexString: "0xF8F8F8")
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1

        self.addSubview(iconImageView)
        iconImageView.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.left.equalTo(self.snp.left).offset(25)
            $0.width.height.equalTo(48)
        }
        
        self.addSubview(shipmentLabel)
        shipmentLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.top)
            $0.left.equalTo(iconImageView.snp.right).offset(25)
        }
        
        self.addSubview(timeLabel)
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(shipmentLabel.snp.bottom).offset(4)
            $0.left.equalTo(iconImageView.snp.right).offset(25)
        }
        
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.right.equalTo(self.snp.right).offset(-25)
        }
        
        self.addSubview(checkImageView)
        checkImageView.snp.makeConstraints {
            $0.top.right.equalTo(self)
        }
    }
    
}

