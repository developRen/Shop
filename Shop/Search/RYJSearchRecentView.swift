//
//  RYJSearchRecentView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/17.
//

import UIKit

class RYJSearchRecentView: UIView {

    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 250))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.rowHeight = 50
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RYJSearchRecentView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension RYJSearchRecentView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: RYJSearchRecentCell? = tableView.dequeueReusableCell(withIdentifier: "RecentTableViewCell") as? RYJSearchRecentCell
        if cell == nil {
            cell = RYJSearchRecentCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "RecentTableViewCell")
        }

        if indexPath.row == 0 {
            cell?.titleLabel.text = "My recent searches"
            cell?.arrowImageView.isHidden = true
        } else if indexPath.row == 2 {
            cell?.brandLabel.text = "Dior"
            cell?.productLabel.text = "Women, shoes"
            cell?.arrowImageView.isHidden = false
        } else if indexPath.row == 3 {
            cell?.brandLabel.text = "Prada"
            cell?.productLabel.text = "Women, skirts"
            cell?.arrowImageView.isHidden = false
        } else if indexPath.row == 4 {
            cell?.brandLabel.text = "Wrangler"
            cell?.productLabel.text = "Women, trousers"
            cell?.arrowImageView.isHidden = false
        } else {
            cell?.brandLabel.text = "Hugo Boss"
            cell?.productLabel.text = "Women, jacket"
            cell?.arrowImageView.isHidden = false
        }
        
        return cell!
    }
}

class RYJSearchRecentCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var brandLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var productLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        return label
    }()
    
    lazy var line: UIView = {
        let line = UIView.init(frame: CGRect.zero)
        line.backgroundColor = UIColor.hex(hexString: "0xE9E9E9")
        return line
    }()
    
    lazy var arrowImageView: UIImageView = {
        let arrow = UIImageView.init(image: UIImage.init(named: "search_recent_more"))
        return arrow
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.bottom.equalTo(self)
        }
        
        self.addSubview(brandLabel)
        brandLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.bottom.equalTo(self)
        }
        
        self.addSubview(productLabel)
        productLabel.snp.makeConstraints {
            $0.left.equalTo(self.brandLabel.snp.right).offset(18)
            $0.top.bottom.equalTo(self)
        }
        
        self.addSubview(line)
        line.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.bottom.equalTo(self)
            $0.height.equalTo(1)
            $0.width.equalTo(screenWidth - 20)
        }
        
        self.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(screenWidth - 30)
            $0.centerY.equalTo(self.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
