//
//  RYJRefresh.swift
//  Shop
//
//  Created by 任一杰 on 2020/12/21.
//

import UIKit
import MJRefresh

extension UIScrollView {
    var ryjHead: MJRefreshHeader {
        get { return mj_header! }
        set { mj_header = newValue }
    }
    
    var ryjFoot: MJRefreshFooter {
        get { return mj_footer! }
        set { mj_footer = newValue }
    }
}

class RYJRefreshNormalHeader: MJRefreshNormalHeader {}
