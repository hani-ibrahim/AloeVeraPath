//
//  Point.swift
//  DrawingKit
//
//  Created by Hani on 02.09.18.
//  Copyright © 2018 Hani. All rights reserved.
//

import UIKit

func move(to endPoint: CGPoint) -> Path {
    return { (start, transform, path) in
        path.move(to: endPoint)
        return PathEnd(
            point: endPoint,
            angle: start.point.angle(to: endPoint),
            length: 0
        )
    }
}
