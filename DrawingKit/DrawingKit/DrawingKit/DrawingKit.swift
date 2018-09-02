//
//  DrawingKit.swift
//  DrawingKit
//
//  Created by Hani on 02.09.18.
//  Copyright © 2018 Hani. All rights reserved.
//

import UIKit

struct Drawing {
    var paths: [Path]
    
    var cgPath: CGPath {
        let cgPath = CGMutablePath()
        _ = paths.reduce(.zero) { (start, path) -> PathStart in
            let pathEnd = path(start, .identity, cgPath)
            return PathStart(point: pathEnd.point, angle: pathEnd.angle)
        }
        return cgPath
    }
}

struct PathStart {
    static let zero = PathStart(point: .zero, angle: 0)
    
    let point: CGPoint
    let angle: CGFloat
}

struct PathEnd {
    let point: CGPoint
    let angle: CGFloat
    let length: CGFloat
}

struct PathTransform {
    static let identity = PathTransform(translation: .zero, rotationAngle: 0, scale: CGSize(width: 1, height: 1))
    
    let translation: CGPoint
    let rotationAngle: CGFloat
    let scale: CGSize
}

typealias Path = (PathStart, PathTransform, CGMutablePath) -> PathEnd

func move(to endPoint: CGPoint) -> Path {
    return { (start, transform, path) in
        path.move(to: endPoint)
        return PathEnd(point: endPoint,
                       angle: start.point.angle(to: endPoint),
                       length: 0)
    }
}

func line(to endPoint: CGPoint) -> Path {
    return { (start, transform, path) in
        path.addLine(to: endPoint)
        return PathEnd(point: endPoint,
                       angle: start.point.angle(to: endPoint),
                       length: start.point.distance(to: endPoint))
    }
}

func line(by distance: CGPoint) -> Path {
    return { (start, transform, path) in
        let endPoint = CGPoint(x: start.point.x + distance.x,
                               y: start.point.y + distance.y)
        path.addLine(to: endPoint)
        return PathEnd(point: endPoint,
                       angle: start.point.angle(to: endPoint),
                       length: start.point.distance(to: endPoint))
    }
}

func line(by length: CGFloat, angle: CGFloat) -> Path {
    return { (start, transform, path) in
        let endPoint = CGPoint(x: start.point.x + length * cos(angle + start.angle),
                               y: start.point.y + length * sin(angle + start.angle))
        path.addLine(to: endPoint)
        return PathEnd(point: endPoint,
                       angle: start.point.angle(to: endPoint),
                       length: length)
    }
}
