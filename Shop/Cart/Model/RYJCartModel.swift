//
//  RYJCartModel.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/21.
//

import Foundation

struct RYJCartModel {
    // 产品图片
    var pdImage: String?
    // 产品名
    var pdName: String?
    // 产品品牌
    var pdBrand: String?
    // 产品大小
    var pdSize: String?
    // 产品颜色
    var pdColor: String?
    // 产品数量
    var pdQuantity: String?
    // 产品价格
    var pdPrice: String?
    
    init(pdImage: String,
         pdName: String,
         pdBrand: String,
         pdSize: String,
         pdColor: String,
         pdQuantity: String,
         pdPrice: String) {
        self.pdImage = pdImage
        self.pdName = pdName
        self.pdBrand = pdBrand
        self.pdSize = pdSize
        self.pdColor = pdColor
        self.pdQuantity = pdQuantity
        self.pdPrice = pdPrice
    }
    
    static func defaultData() -> Array<RYJCartModel> {
        let product_1 = RYJCartModel.init(pdImage: "cart_product_1",
                                          pdName: "Jacket in blue denim",
                                          pdBrand: "Wrangler",
                                          pdSize: "S",
                                          pdColor: "0xECB900",
                                          pdQuantity: "1",
                                          pdPrice: "230")
        
        let product_2 = RYJCartModel.init(pdImage: "cart_product_2",
                                          pdName: "T-shirt Mark Lebon Julie",
                                          pdBrand: "Prada",
                                          pdSize: "S",
                                          pdColor: "0xEE711D",
                                          pdQuantity: "1",
                                          pdPrice: "50")
        
        let product_3 = RYJCartModel.init(pdImage: "cart_product_3",
                                          pdName: "Bananas pattern",
                                          pdBrand: "Dior",
                                          pdSize: "S",
                                          pdColor: "0x2FAEF8",
                                          pdQuantity: "1",
                                          pdPrice: "150")

        return [product_1, product_2, product_3]
    }
    
}
