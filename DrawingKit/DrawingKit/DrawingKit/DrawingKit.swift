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
