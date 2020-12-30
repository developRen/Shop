//
//  RYJHomeBannerView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/22.
//

import UIKit

class RYJHomeBannerView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: screenWidth , height: 349)
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectView = UICollectionView.init(frame: CGRect.init(x: 0, y: 108, width: screenWidth, height: 349), collectionViewLayout: layout)
        collectView.backgroundColor = .clear
        collectView.isPagingEnabled = true
        collectView.delegate = self
        collectView.dataSource = self
        collectView.showsVerticalScrollIndicator = false
        collectView.showsHorizontalScrollIndicator = false
        collectView.register(RYJHomeBannerCell.classForCoder(), forCellWithReuseIdentifier: "RYJHomeBannerCell")
        return collectView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl.init(frame: CGRect.zero)
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.hex(hexString: "0x2F69F8")
        pageControl.pageIndicatorTintColor = UIColor.hex(hexString: "0xE0E0E0")
        return pageControl
    }()
    
    // 定时器
    var timer: Timer?
    // 当前选中下标
    var currentIndex: Int = 0
    // 自动滚动时间间隔,默认3s
    var timeInterval: TimeInterval = 3.0

    typealias selectBlock = (_ indexPath: IndexPath) ->()
    var didSelectBlock: selectBlock!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addGradientLayer()
        
        self.addSubview(collectionView)
        let index: IndexPath = IndexPath.init(row: 51, section: 0)
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        currentIndex = 51
        
        self.addSubview(pageControl)
        pageControl.snp.makeConstraints {
            $0.centerX.equalTo(self.collectionView.snp.centerX)
            $0.height.equalTo(10)
            $0.width.equalTo(200)
            $0.bottom.equalTo(self.snp.bottom).offset(-13.5)
        }
        
        play()
    }
    
    // 添加背景渐变
    func addGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: 457)
        self.layer.addSublayer(gradientLayer)
        let topColor = UIColor.hex(hexString: "0xFFFFFF").cgColor
        let bottomColor = UIColor.hex(hexString: "0xF8F8F8").cgColor
        gradientLayer.colors = [topColor, bottomColor]
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        gradientLayer.locations = gradientLocations
        gradientLayer.startPoint = CGPoint.init(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 0.5, y: 1)
    }
    
    fileprivate func play() {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true, block: {[weak self] (timer) in
                self?.nextCell()
            })
        }
        self.timer?.fireDate = Date.init(timeIntervalSinceNow: timeInterval)
    }
    
    // 滚动到下一个
    @objc fileprivate func nextCell() {
        currentIndex += 1
        let index: IndexPath = IndexPath.init(row: currentIndex, section: 0)
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        
        resetPage()
    }
    
    // 继续滚动轮播图
    func resumePlay() {
        self.play()
    }
    
    // 暂停自动滚动
    func pause() {
        if let timer = self.timer {
            timer.fireDate = Date.distantFuture
        }
    }
    
    // 停止滚动(释放timer资源,防止内存泄漏)
    func stop() {
        self.pause()
        self.releaseTimer()
    }
    
    // 释放timer资源,防止内存泄漏
    fileprivate func releaseTimer() {
        if let timer = self.timer {
            timer.invalidate()
            self.timer = nil
        }
    }
    
    // cell错位检测和调整
    func adjustErrorCell(isScroll: Bool, animation: Bool = true) {
        let indexPaths = self.collectionView.indexPathsForVisibleItems
        var attriArr = [UICollectionViewLayoutAttributes?]()
        for indexPath in indexPaths {
            let attri = self.collectionView.layoutAttributesForItem(at: indexPath)
            attriArr.append(attri)
        }
        let centerX: CGFloat = self.collectionView.contentOffset.x + self.collectionView.frame.width * 0.5
        var minSpace = CGFloat(MAXFLOAT)
        for atr in attriArr {
            if let obj = atr {
                obj.zIndex = 0;
                if(abs(minSpace) > abs(obj.center.x - centerX)) {
                    minSpace = obj.center.x - centerX;
                    self.currentIndex = obj.indexPath.row;
                }
            }
        }
        if isScroll {
            self.ryj_scrollViewWillBeginDecelerating(self.collectionView, animation: animation)
        }
    }
    
    func resetPage() {
        let page = currentIndex % 3
        pageControl.currentPage = page
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RYJHomeBannerView: UIScrollViewDelegate {
    // 开始拖拽
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // 暂停滚动
        self.pause()
    }
    
    // 将要结束拖拽
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // 这里不用考虑越界问题,其他地方做了保护
        if velocity.x > 0 {
            // 左滑,下一张
            self.currentIndex = self.currentIndex + 1
        } else if velocity.x < 0 {
            // 右滑, 上一张
            self.currentIndex = self.currentIndex - 1
        } else if velocity.x == 0 {
            self.adjustErrorCell(isScroll: false)
            if #available(iOS 14.0, *) {
                self.scrollViewWillBeginDecelerating(self.collectionView);
            }
        }
        
        resetPage()
    }
    
    // 将要开始减速
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        ryj_scrollViewWillBeginDecelerating(scrollView, animation: true)
    }
    
    func ryj_scrollViewWillBeginDecelerating(_ scrollView: UIScrollView, animation: Bool = true) {
        guard self.currentIndex >= 0, self.currentIndex < 100 else {
            // 越界保护
            return
        }
        
        let index: IndexPath = IndexPath.init(row: currentIndex, section: 0)
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: animation)
    }
    
    // 结束减速
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.collectionView.isPagingEnabled = false
    }
    
    // 滚动动画完成
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.collectionView.isPagingEnabled = false
        self.resumePlay()
    }
    
    // 滚动中
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pause()
    }
}

extension RYJHomeBannerView: UICollectionViewDelegate {
    // 点击Banner
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let _ = didSelectBlock {
            didSelectBlock(indexPath)
        }
    }
}

extension RYJHomeBannerView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellString = "RYJHomeBannerCell"
        let cell: RYJHomeBannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellString, for: indexPath) as! RYJHomeBannerCell
        return cell
    }
    
}

class RYJHomeBannerCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(image: UIImage.init(named: "home_banner"))
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.setImage(UIImage.init(named: "home_cart"), for: UIControl.State.normal)
        return button
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.backgroundColor = UIColor.hex(hexString: "0x7750EA")
        label.text = "NEW"
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.layer.cornerRadius = 2
        label.font = UIFont.systemFont(ofSize: 8)
        label.layer.masksToBounds = true
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Twerk it"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var introduceLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Long 3/4 sleevs, sweartshirt"
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "¥ 200"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var VATLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "VAT included"
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(self.snp.top).offset(20)
            $0.right.equalTo(self.snp.right).offset(-20)
            $0.height.equalTo(206)
        }
        
        self.contentView.addSubview(buyButton)
        buyButton.snp.makeConstraints {
            $0.centerY.equalTo(imageView.snp.bottom)
            $0.right.equalTo(imageView.snp.right).offset(-20)
            $0.width.height.equalTo(50)
        }
        
        self.contentView.addSubview(typeLabel)
        typeLabel.snp.makeConstraints {
            $0.left.equalTo(imageView.snp.left)
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.width.equalTo(24)
            $0.height.equalTo(12)
        }
        
        self.contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.left.equalTo(imageView.snp.left)
            $0.top.equalTo(imageView.snp.bottom).offset(46)
        }
        
        self.contentView.addSubview(introduceLabel)
        introduceLabel.snp.makeConstraints {
            $0.left.equalTo(imageView.snp.left)
            $0.top.equalTo(imageView.snp.bottom).offset(73)
        }
        
        self.contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.right.equalTo(self.snp.left).offset(screenWidth - 20)
            $0.centerY.equalTo(nameLabel.snp.centerY)
        }
        
        self.contentView.addSubview(VATLabel)
        VATLabel.snp.makeConstraints {
            $0.right.equalTo(self.snp.left).offset(screenWidth - 20)
            $0.centerY.equalTo(introduceLabel.snp.centerY)
        }
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

