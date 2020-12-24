//
//  RYJSearchRankingView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/15.
//

import UIKit

class RYJSearchRankingView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 100))
        scrollView.delegate = self;
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize.init(width: 120 * 4 + 20 * 5, height: 0)
        return scrollView
    }()
    
    private lazy var topRankingItem: RYJSearchRankingItem = {
        let Item = RYJSearchRankingItem.init(icon: "rank_shirt", text: "Top")
        return Item
    }()
    
    private lazy var shoesRankingItem: RYJSearchRankingItem = {
        let Item = RYJSearchRankingItem.init(icon: "rank_shoes", text: "Shoes")
        return Item
    }()
    
    private lazy var trousersRankingItem: RYJSearchRankingItem = {
        let Item = RYJSearchRankingItem.init(icon: "rank_trousers", text: "Trousers")
        return Item
    }()
    
    private lazy var shirtRankingItem: RYJSearchRankingItem = {
        let Item = RYJSearchRankingItem.init(icon: "rank_shirt", text: "Shirt")
        return Item
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(scrollView)
        
        scrollView.addSubview(topRankingItem)
        scrollView.addSubview(shoesRankingItem)
        scrollView.addSubview(trousersRankingItem)
        scrollView.addSubview(shirtRankingItem)
        
        topRankingItem.snp.makeConstraints {
            $0.left.equalTo(self.scrollView.snp.left).offset(20)
            $0.top.equalTo(self.scrollView.snp.top)
            $0.width.equalTo(120)
            $0.height.equalTo(100)
        }

        shoesRankingItem.snp.makeConstraints {
            $0.left.equalTo(self.topRankingItem.snp.right).offset(20)
            $0.top.equalTo(self.snp.top)
            $0.width.equalTo(120)
            $0.height.equalTo(100)
        }

        trousersRankingItem.snp.makeConstraints {
            $0.left.equalTo(self.shoesRankingItem.snp.right).offset(20)
            $0.top.equalTo(self.snp.top)
            $0.width.equalTo(120)
            $0.height.equalTo(100)
        }
        
        shirtRankingItem.snp.makeConstraints {
            $0.left.equalTo(self.trousersRankingItem.snp.right).offset(20)
            $0.top.equalTo(self.snp.top)
            $0.width.equalTo(120)
            $0.height.equalTo(100)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RYJSearchRankingView: UIScrollViewDelegate {

}


class RYJSearchRankingItem: UIView {
    
    lazy var rankImageView: UIImageView = {
        let icon = UIImageView.init(frame: CGRect.zero)
        icon.backgroundColor = UIColor.clear
        return icon
    }()
    
    lazy var rankLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.hex(hexString: "0x2F69F8")
        return label
    }()
    
    init(icon: String, text: String) {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = UIColor.hex(hexString: "0xF4F4F4")
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        
        rankImageView.image = UIImage.init(named: icon)
        rankLabel.text = text
        self.addSubview(rankImageView)
        self.addSubview(rankLabel)

        rankImageView.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.top.equalTo(self.snp.top).offset(14)
            $0.width.height.equalTo(48)
        }

        rankLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.top.equalTo(self.rankImageView.snp.bottom).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
