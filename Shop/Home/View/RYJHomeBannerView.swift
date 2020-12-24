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
    
    // 定时器
    var timer: Timer?
    // 当前选中下标
    var currentIndex: Int = 0
    // 自动滚动时间间隔,默认3s
    var timeInterval: TimeInterval = 3.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addGradientLayer()
        
        self.addSubview(collectionView)
        let index: IndexPath = IndexPath.init(row: 51, section: 0)
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
        currentIndex = 51
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: {[weak self] (timer) in
                self?.nextCell()
            })
        }
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
        let index: IndexPath = IndexPath.init(row: currentIndex + 1, section: 0)
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension RYJHomeBannerView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellString = "RYJHomeBannerCell"
        let cell: RYJHomeBannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellString, for: indexPath) as! RYJHomeBannerCell
        if indexPath.row % 3 == 0 {
            cell.backgroundColor = UIColor.green
        } else if indexPath.row % 3 == 1 {
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.backgroundColor = UIColor.red
        }
        return cell
    }
    
}

class RYJHomeBannerCell: UICollectionViewCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

