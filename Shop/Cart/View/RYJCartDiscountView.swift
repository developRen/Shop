//
//  RYJCartDiscountView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/18.
//

import UIKit

class RYJCartDiscountView: UIView {

    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "cart_discount_bg"))
        return imageView
    }()
    
    lazy var discountImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "cart_gift"))
        return imageView
    }()
    
    lazy var discountLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "-10%"
        label.textColor = UIColor.hex(hexString: "0x2F69F8")
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var describeLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Enjoy Student Discount"
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var giftLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "give a gift"
        label.textColor = UIColor.hex(hexString: "0x2F69F8")
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(bgImageView)
        bgImageView.snp.makeConstraints {
            $0.left.top.bottom.equalTo(self)
            $0.width.equalTo(screenWidth - 40)
        }
        
        self.addSubview(discountImageView)
        discountImageView.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(25)
            $0.centerY.equalTo(self.snp.centerY)
        }
        
        self.addSubview(discountLabel)
        discountLabel.snp.makeConstraints {
            $0.left.equalTo(discountImageView.snp.right).offset(25)
            $0.top.equalTo(discountImageView.snp.top).offset(10)
        }

        self.addSubview(describeLabel)
        describeLabel.snp.makeConstraints {
            $0.left.equalTo(discountImageView.snp.right).offset(25)
            $0.bottom.equalTo(discountImageView.snp.bottom)
        }
        
        self.addSubview(giftLabel)
        giftLabel.snp.makeConstraints {
            $0.right.equalTo(self.snp.right)
            $0.centerY.equalTo(self.snp.centerY)
            $0.width.equalTo(75)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
