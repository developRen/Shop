//
//  RYJSearchViewController.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/15.
//

import UIKit

class RYJSearchViewController: RYJBaseViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect.zero)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize.init(width: screenWidth, height: 570)
        return scrollView
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField.init()
        textField.placeholder = "  What are you looking for?"
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.layer.cornerRadius = 4
        textField.layer.masksToBounds = true
        textField.backgroundColor = UIColor.hex(hexString: "0xF4F4F4")
        return textField
    }()
    
    lazy var rankingView: RYJSearchRankingView = {
        let rankingView = RYJSearchRankingView.init(frame: CGRect.zero)
        return rankingView
    }()
    
    lazy var recentView: RYJSearchRecentView = {
        let recentView = RYJSearchRecentView.init(frame: CGRect.zero)
        return recentView
    }()
    
    lazy var bottomImageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "search_ad"))
        imageView.layer.cornerRadius = 4
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "Search"

        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(self.titleLine.snp.bottom)
            $0.left.right.bottom.equalTo(self.view)
        }
        
        scrollView.addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(self.scrollView.snp.top).offset(10)
            $0.left.equalTo(self.scrollView.snp.left).offset(20)
            $0.width.equalTo(screenWidth - 40)
            $0.height.equalTo(40)
        }
        
        scrollView.addSubview(rankingView)
        rankingView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(20)
            $0.left.equalTo(self.scrollView.snp.left)
            $0.width.equalTo(self.scrollView.snp.width)
            $0.height.equalTo(100)
        }
        
        scrollView.addSubview(recentView)
        recentView.snp.makeConstraints {
            $0.top.equalTo(rankingView.snp.bottom).offset(10)
            $0.left.equalTo(self.scrollView.snp.left)
            $0.width.equalTo(self.scrollView.snp.width)
            $0.height.equalTo(250)
        }
        
        scrollView.addSubview(bottomImageView)
        bottomImageView.snp.makeConstraints {
            $0.top.equalTo(recentView.snp.bottom).offset(20)
            $0.left.equalTo(self.scrollView.snp.left).offset(20)
            $0.width.equalTo(screenWidth - 40)
            $0.height.equalTo(120)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchTextField.endEditing(false)
    }
}
