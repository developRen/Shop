//
//  RYJDetailViewController.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/30.
//

import UIKit

class RYJDetailViewController: UIViewController {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight))
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        scrollView.contentSize = CGSize.init(width: 0, height: 900)
        return scrollView
    }()
    
    lazy var headerView: RYJDetailHeaderView = {
        let headerView = RYJDetailHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 284))
        return headerView
    }()
    
    lazy var describeView: RYJDetailDescribeView = {
        let describeView = RYJDetailDescribeView.init(frame: CGRect.init(x: 0, y: 284, width: screenWidth, height: 320))
        return describeView
    }()
    
    lazy var likeView: RYJHomeLikeView = {
        let likeView = RYJHomeLikeView.init(frame: CGRect.init(x: 0, y: 604, width: screenWidth, height: 220))
        return likeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .white

        self.view.addSubview(scrollView)
        
        headerView.closeButtonBlock = {
            [weak self] in self?.dismiss(animated: true) {}
        }
        scrollView.addSubview(headerView)

        scrollView.addSubview(describeView)
        
        likeView.titleLabel.text = "More from Wrangler"
        scrollView.addSubview(likeView)

    }

}
