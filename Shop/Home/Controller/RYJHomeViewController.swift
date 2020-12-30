//
//  RYJHomeViewController.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/14.
//

import UIKit

class RYJHomeViewController: RYJBaseViewController {
    
    lazy var bannerView: RYJHomeBannerView = {
        let bannerView = RYJHomeBannerView.init(frame: CGRect.zero)
        return bannerView
    }()
    
    lazy var likeView: RYJHomeLikeView = {
        let likeView = RYJHomeLikeView.init(frame: CGRect.zero)
        return likeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "New Collection"
        
        bannerView.didSelectBlock = {
            [weak self] in
            _ = $0.row
            let detailVC = RYJDetailViewController.init()
            detailVC.modalPresentationStyle = .fullScreen
            self?.present(detailVC, animated: true, completion: {})
        }
        self.view.addSubview(bannerView)
        self.view.sendSubviewToBack(bannerView)
        bannerView.snp.makeConstraints {
            $0.left.top.right.equalTo(self.view)
            $0.height.equalTo(457)
        }
        
        self.view.addSubview(likeView)
        likeView.snp.makeConstraints {
            $0.left.right.equalTo(self.view)
            $0.top.equalTo(self.bannerView.snp.bottom).offset(10)
            $0.height.equalTo(250)
        }
        
        
    }

}

