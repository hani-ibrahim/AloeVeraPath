//
//  UIKit.swift
//  DrawingKit
//
//  Created by Hani on 02.09.18.
//  Copyright © 2018 Hani. All rights reserved.
//

import UIKit

extension CGPoint {
    func distance(to point:CGPoint) -> CGFloat {
        return sqrt(pow(x - point.x, 2) + pow(y - point.y, 2))
    }
    
    func angle(to point: CGPoint) -> CGFloat {
        return atan2(point.y - y, point.x - x)
    }
}
