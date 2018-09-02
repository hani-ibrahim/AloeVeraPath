//
//  ViewController.swift
//  DrawingKit
//
//  Created by Hani on 02.09.18.
//  Copyright © 2018 Hani. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var drawingView: DrawingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        drawingView.setNeedsDisplay()
    }
}

