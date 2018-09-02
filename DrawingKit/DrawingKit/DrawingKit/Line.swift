//
//  Line.swift
//  DrawingKit
//
//  Created by Hani on 02.09.18.
//  Copyright © 2018 Hani. All rights reserved.
//

import UIKit

func line(to endPoint: CGPoint) -> Path {
    return { (start, transform, path) in
        path.addLine(to: endPoint)
        return PathEnd(
            point: endPoint,
            angle: start.point.angle(to: endPoint),
            length: start.point.distance(to: endPoint)
        )
    }
}

func line(by distance: CGPoint) -> Path {
    return { (start, transform, path) in
        let endPoint = CGPoint(
            x: start.point.x + distance.x,
            y: start.point.y + distance.y
        )
        path.addLine(to: endPoint)
        return PathEnd(
            point: endPoint,
            angle: start.point.angle(to: endPoint),
            length: start.point.distance(to: endPoint)
        )
    }
}

func line(by length: CGFloat, angle: CGFloat) -> Path {
    return { (start, transform, path) in
        let endPoint = CGPoint(
            x: start.point.x + length * cos(angle + start.angle),
            y: start.point.y + length * sin(angle + start.angle)
        )
        path.addLine(to: endPoint)
        return PathEnd(
            point: endPoint,
            angle: start.point.angle(to: endPoint),
            length: length
        )
    }
}
