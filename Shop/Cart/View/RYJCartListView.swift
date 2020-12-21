//
//  RYJCartListView.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/21.
//

import UIKit

class RYJCartListView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()
    
    lazy var productData: Array<RYJCartModel> = {
        let data = RYJCartModel.defaultData()
        return data
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.snp.edges)
        }
    }
    
    func addDeleteButton() {
        for subview in self.tableView.subviews {
            let isPullView = subview.subviews.first?.isKind(of: NSClassFromString("UISwipeActionPullView")!)
            if (isPullView!) {
                let isStandardButton = subview.subviews.first?.subviews[0].isKind(of: NSClassFromString("UISwipeActionStandardButton")!)
                if (isStandardButton!) {
                    self.configDeleteButton(button: subview.subviews.first?.subviews[0] as! UIButton)
                }
            }
        }
    }
    
    func configDeleteButton(button :UIButton){
        button.setImage(UIImage.init(named:"cart_trash"), for: .normal)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension RYJCartListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return ""
    }
}

extension RYJCartListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            productData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: RYJCartListCell? = tableView.dequeueReusableCell(withIdentifier: "RYJCartListCell") as? RYJCartListCell
        if cell == nil {
            cell = RYJCartListCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "RYJCartListCell")
        }
        let product: RYJCartModel = productData[indexPath.row]
        cell?.pdImageView.image = UIImage.init(named: product.pdImage!)
        cell?.pdNameLabel.text = product.pdName
        cell?.pdBrandLabel.text = product.pdBrand
        cell?.pdSizeLabel.text = "Size: " + product.pdSize!
        cell?.pdColorView.backgroundColor = UIColor.hex(hexString: product.pdColor!)
        cell?.pdQuantityLabel.text = "Quantity: " + product.pdQuantity!
        cell?.pdPriceLabel.text = "$ " + product.pdPrice!
        return cell!
    }
}

class RYJCartListCell: UITableViewCell {
    
    lazy var pdImageView: UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.zero)
        return imageView
    }()
    
    lazy var pdNameLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        return label
    }()
    
    lazy var pdBrandLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        return label
    }()
    
    lazy var pdSizeLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        return label
    }()
    
    lazy var pdColorLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = "Color: "
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        return label
    }()
    
    lazy var pdColorView: UIView = {
        let view = UIView.init(frame: CGRect.zero)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var pdQuantityLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.hex(hexString: "0x6A6A6A")
        return label
    }()
    
    lazy var pdPriceLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.hex(hexString: "0x2F69F8")
        label.textAlignment = NSTextAlignment.right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(pdImageView)
        pdImageView.snp.makeConstraints {
            $0.left.equalTo(self.snp.left).offset(20)
            $0.top.equalTo(self.snp.top).offset(10)
            $0.width.height.equalTo(100)
        }
        
        self.contentView.addSubview(pdNameLabel)
        pdNameLabel.snp.makeConstraints {
            $0.left.equalTo(pdImageView.snp.right).offset(20)
            $0.top.equalTo(pdImageView.snp.top).offset(4)
        }
        
        self.contentView.addSubview(pdQuantityLabel)
        pdQuantityLabel.snp.makeConstraints {
            $0.left.equalTo(pdImageView.snp.right).offset(20)
            $0.bottom.equalTo(pdImageView.snp.bottom)
        }
                
        self.contentView.addSubview(pdColorLabel)
        pdColorLabel.snp.makeConstraints {
            $0.left.equalTo(pdImageView.snp.right).offset(20)
            $0.bottom.equalTo(pdQuantityLabel.snp.top).offset(-2)
        }
        
        self.contentView.addSubview(pdColorView)
        pdColorView.snp.makeConstraints {
            $0.centerY.equalTo(pdColorLabel.snp.centerY)
            $0.left.equalTo(pdColorLabel.snp.right).offset(0)
            $0.width.height.equalTo(10)
        }
        
        self.contentView.addSubview(pdSizeLabel)
        pdSizeLabel.snp.makeConstraints {
            $0.left.equalTo(pdImageView.snp.right).offset(20)
            $0.bottom.equalTo(pdColorLabel.snp.top).offset(-2)
        }
        
        self.contentView.addSubview(pdBrandLabel)
        pdBrandLabel.snp.makeConstraints {
            $0.left.equalTo(pdImageView.snp.right).offset(20)
            $0.bottom.equalTo(pdSizeLabel.snp.top).offset(-2)
        }
        
        self.contentView.addSubview(pdPriceLabel)
        pdPriceLabel.snp.makeConstraints {
            $0.left.equalTo(self.snp.left)
            $0.centerY.equalTo(self.pdNameLabel.snp.centerY)
            $0.width.equalTo(screenWidth - 20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
