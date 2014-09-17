//
//  CanvasView.swift
//  FingerPaint
//
//  Created by Howard Yeh on 2014-09-15.
//  Copyright (c) 2014 Howard Yeh. All rights reserved.
//

import UIKit

class CanvasView: UIView {


    var paths: [Path] = []
    private var currentPath: Path?

    var currentColor: UIColor = UIColor.blackColor() {
        didSet {
            self.setNeedsDisplay()
        }
    }

    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.currentPath = Path(color: currentColor)
        paths.append(currentPath!)
        addToPath(touches)
    }

    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!)  {
        // println("move: \(pt1)")
        addToPath(touches)
        self.setNeedsDisplay()
    }

    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        addToPath(touches)
        self.currentPath = nil
    }

    private func addToPath(touches: NSSet) {
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        self.currentPath!.add(point)
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)

        for path in paths {
            let points = path.points
            for i in 0..<points.count-1 {
                let p1 = points[i]
                let p2 = points[i+1]
                CGContextMoveToPoint(context, p1.x, p1.y)
                CGContextAddLineToPoint(context, p2.x, p2.y)
            }
            CGContextSetLineWidth(context, 2)
            CGContextSetStrokeColorWithColor(context,path.color.CGColor)
            CGContextStrokePath(context)
        }
    }

}
