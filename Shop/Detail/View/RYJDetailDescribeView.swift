//
//  RYJDetailDescribeView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/30.
//

import UIKit

class RYJDetailDescribeView: UIView {

    lazy var tagLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 20, y: 20, width: 60, height: 12))
        label.text = "GOOD PRICE"
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .hex(hexString: "0xEA8250")
        label.font = .systemFont(ofSize: 8)
        label.layer.cornerRadius = 2
        label.layer.masksToBounds = true
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Jacket in blue denim"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "$ 120"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var explainLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Wrangler Vintage-style womens’s"
        label.textColor = .hex(hexString: "0x6A6A6A")
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var VATLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "VAT included"
        label.textColor = .hex(hexString: "0x6A6A6A")
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var line1: UIView = {
        let label = UIView.init(frame: CGRect.init(x: 20, y: 154, width: screenWidth - 40, height: 1))
        label.backgroundColor = .hex(hexString: "0xEDEDED")
        return label
    }()
    
    lazy var cottonImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.image = UIImage.init(named: "detail_cotton")
        return imageView
    }()
    
    lazy var cottonLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "100% Cotton"
        label.textColor = .hex(hexString: "0x222222")
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var line2: UIView = {
        let label = UIView.init(frame: CGRect.init(x: 20, y: 210, width: screenWidth - 40, height: 1))
        label.backgroundColor = .hex(hexString: "0xEDEDED")
        return label
    }()
    
    lazy var zanImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.image = UIImage.init(named: "detail_zan")
        return imageView
    }()
    
    lazy var zanLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "4,5 / 5"
        label.textColor = .hex(hexString: "0x222222")
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        imageView.image = UIImage.init(named: "detail_more_arrow")
        return imageView
    }()
    
    lazy var reviewLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Reviews 12"
        label.textColor = .hex(hexString: "0x717171")
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        let str = "Get back to basics in this pared-down denim jacket with mild distressing on the seams and a mix fabric collar that adds extra character to this already fetching top."
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = 13
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13),
                          NSAttributedString.Key.paragraphStyle: paraph]
        label.attributedText = NSAttributedString(string: str, attributes: attributes)
        label.textColor = .hex(hexString: "0x222222")
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tagLabel)
        
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(self.snp.top).offset(40)
        }

        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.right.equalTo(self.snp.left).offset(screenWidth - 20)
            $0.centerY.equalTo(nameLabel.snp.centerY)
        }
        
        self.addSubview(explainLabel)
        explainLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(self.snp.top).offset(69)
        }
        
        self.addSubview(VATLabel)
        VATLabel.snp.makeConstraints {
            $0.right.equalTo(self.snp.left).offset(screenWidth - 20)
            $0.centerY.equalTo(explainLabel.snp.centerY)
        }
        
        self.addSubview(line1)
        
        self.addSubview(cottonImageView)
        cottonImageView.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(self.snp.top).offset(114)
            $0.width.height.equalTo(26)
        }
        
        self.addSubview(cottonLabel)
        cottonLabel.snp.makeConstraints {
            $0.left.equalTo(cottonImageView.snp.right).offset(7)
            $0.centerY.equalTo(cottonImageView.snp.centerY)
        }
        
        self.addSubview(line2)
        
        self.addSubview(zanImageView)
        zanImageView.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(line1.snp.bottom).offset(15)
            $0.width.height.equalTo(26)
        }
        
        self.addSubview(zanLabel)
        zanLabel.snp.makeConstraints {
            $0.left.equalTo(zanImageView.snp.right).offset(7)
            $0.centerY.equalTo(zanImageView.snp.centerY)
        }
        
        self.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints {
            $0.right.equalTo(self.snp.right).offset(-20)
            $0.centerY.equalTo(zanImageView.snp.centerY)
        }
        
        self.addSubview(reviewLabel)
        reviewLabel.snp.makeConstraints {
            $0.right.equalTo(self.snp.right).offset(-60)
            $0.centerY.equalTo(zanImageView.snp.centerY)
        }
        
        self.addSubview(detailLabel)
        detailLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.right.equalTo(self.snp.right).offset(-20)
            $0.top.equalTo(line2.snp.bottom).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
