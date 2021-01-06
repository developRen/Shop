//
//  RYJShopModel.swift
//  Shop
//
//  Created by 任一杰 on 2021/1/5.
//

import Foundation
import HandyJSON

class weather : HandyJSON {
    var city: String!           // 城市
    var realtime: realtime!     // 当前天气详情情况
    var future: Array<future>!  // 近5天天气情况
    
    required init() {}
}

class realtime : HandyJSON {
    var temperature: String!    // 温度
    var humidity: String!       // 湿度
    var info: String!           // 天气情况，如：晴、多云
    var direct: String!         // 风向
    var power: String!          // 风力
    var aqi: String!            // 空气质量指数

    required init() {}
}

class future : HandyJSON {
    var date: String!           // 日期
    var temperature: String!    // 温度，最低温/最高温
    var weather: String!        // 天气情况，如：晴、多云
    var direct: String!         // 风向

    required init() {}
}

class life : HandyJSON {
    var kongtiao: lifeExponent!       // 空调开启
    var guomin: lifeExponent!         // 过敏
    var shushidu: lifeExponent!       // 舒适度
    var chuanyi: lifeExponent!        // 穿衣
    var diaoyu: lifeExponent!         // 钓鱼
    var ganmao: lifeExponent!         // 感冒
    var ziwaixian: lifeExponent!      // 紫外线
    var xiche: lifeExponent!          // 洗车
    var yundong: lifeExponent!        // 运动
    var daisan: lifeExponent!         // 带伞


    required init() {}
}

class lifeExponent : HandyJSON {
    var v: String!      // 指数
    var des: String!    // 指数详情

    required init() {}
}
