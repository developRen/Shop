//
//  RYJDetailHeaderView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/30.
//

import UIKit

class RYJDetailHeaderView: UIView {
    
    typealias closeBlock = () ->()
    var closeButtonBlock: closeBlock!
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 284))
        imageView.image = UIImage.init(named: "detail_header")
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton.init(frame: CGRect.init(x: screenWidth - 20 - 28, y: 53, width: 28, height: 28))
        button.setImage(UIImage.init(named: "basel_close"), for: UIControl.State.normal)
        return button
    }()
    
    lazy var indexLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "1/8"
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 9)
        // 圆角
        let maskPath = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: 37, height: 12), byRoundingCorners: UIRectCorner(rawValue: UIRectCorner.topLeft.rawValue | UIRectCorner.topRight.rawValue), cornerRadii: CGSize(width: 37, height:12))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = CGRect.init(x: 0, y: 0, width: 37, height: 12)
        maskLayer.path = maskPath.cgPath
        label.layer.mask = maskLayer
        
        return label
    }()
    
    lazy var likeButton: LFFPraiseButton = {
        let likeImage = UIImage.init(named: "home_like_button")
        let button = LFFPraiseButton(frame: CGRect(x: 20, y: 250, width: 36, height: 32), image: likeImage)
        button.imageColorOn = .red
        button.circleColor = .red
        button.imageColorOff = .white
        button.lineColor = .red
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let shareImage = UIImage.init(named: "base_share")
        let button = UIButton(frame: CGRect(x: 64, y: 250, width: 36, height: 32))
        button.setImage(shareImage, for: UIControl.State.normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        self.addSubview(imageView)

        closeButton.addTarget(self, action: #selector(closeButtonClick), for: .touchUpInside)
        self.addSubview(closeButton)
        
        self.addSubview(indexLabel)
        indexLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom)
            $0.centerX.equalTo(self.snp.centerX)
            $0.width.equalTo(37)
            $0.height.equalTo(12)
        }
        
        self.addSubview(likeButton)
        likeButton.addTarget(self, action: #selector(likeButtonClick), for: .touchUpInside)
        
        self.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(shareButtonClick), for: .touchUpInside)
    }
    
    @objc func closeButtonClick(sender: UIButton) {
        if let _ = closeButtonBlock {
            closeButtonBlock()
        }
    }
    
    @objc func likeButtonClick(sender: LFFPraiseButton) {
        if sender.isSelected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
    
    @objc func shareButtonClick(sender: UIButton) {

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
