//
//  RYJShopAPI.swift
//  Shop
//
//  Created by 任一杰 on 2021/1/5.
//

import Foundation
import Moya

// 初始化请求的provider
let RYJShopProvider = MoyaProvider<ShopAPI>()

// 请求分类
public enum ShopAPI {
    case weather    // 天气预报
    case life       // 生活指数
}

// 请求配置
extension ShopAPI: TargetType {
    public var baseURL: URL {
        switch self {
        case .weather, .life:
            return URL(string: "http://apis.juhe.cn")!
        }
    }
    
    public var path: String {
        switch self {
        case .weather:
            return "/simpleWeather/query"
        case .life:
            return "/simpleWeather/life"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .weather:
            return .get
        case .life:
            return .post
        }
    }
    
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    public var task: Task {
        switch self {
        case .weather:
            var params: [String: Any] = [:]
            params["city"] = "杭州"
            params["key"] = "db2a6f6882e7d01e640304aa97c6728b"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .life:
            var params: [String: Any] = [:]
            params["city"] = "杭州"
            params["key"] = "db2a6f6882e7d01e640304aa97c6728b"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}


 
