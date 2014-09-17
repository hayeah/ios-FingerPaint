//
//  CanvasView.swift
//  FingerPaint
//
//  Created by Howard Yeh on 2014-09-15.
//  Copyright (c) 2014 Howard Yeh. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    let zigzag = [(100,100),
                  (100,150),(150,150),
                            (150,200)]

    var currentColor: UIColor = UIColor.blackColor() {
        didSet {
            self.setNeedsDisplay()
        }
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext()

        CGContextBeginPath(context)
        for i in 0..<zigzag.count-1 {
            let (x1,y1) = zigzag[i]
            let (x2,y2) = zigzag[i+1]
            CGContextMoveToPoint(context, CGFloat(x1), CGFloat(y1))
            CGContextAddLineToPoint(context, CGFloat(x2), CGFloat(y2))
        }

        CGContextSetLineWidth(context, 2)
        CGContextSetStrokeColorWithColor(context,currentColor.CGColor)
        CGContextStrokePath(context)

        // CGContextClearRect(context, rect)
    }

}
