//
//  DrawingView.swift
//  DrawingKit
//
//  Created by Hani on 02.09.18.
//  Copyright © 2018 Hani. All rights reserved.
//

import UIKit

final class DrawingView: UIView {
    
    override func draw(_ rect: CGRect) {
        var paths: [Path] = [
            move(to: CGPoint(x: 300, y: 150)),
            move(to: CGPoint(x: 300, y: 150))
        ]
        
        (0..<20).forEach { _ in
            paths.append(line(by: 50, angle: 9 * .pi / 10))
            paths.append(line(by: 50, angle: -8 * .pi / 10))
        }
        
        let drawing = Drawing(paths: paths)
        let context = UIGraphicsGetCurrentContext()!
        context.addPath(drawing.cgPath)
        context.strokePath()
    }
}
