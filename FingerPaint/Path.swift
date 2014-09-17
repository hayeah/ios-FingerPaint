//
//  Path.swift
//  FingerPaint
//
//  Created by Howard Yeh on 2014-09-17.
//  Copyright (c) 2014 Howard Yeh. All rights reserved.
//

import Foundation
import UIKit

class Path {
    var points: [CGPoint] = []
    let color: UIColor
    init(color: UIColor) {
        self.color = color
    }

    func add(point: CGPoint) {
        points.append(point)
    }
}