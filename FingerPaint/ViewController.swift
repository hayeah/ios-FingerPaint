//
//  ViewController.swift
//  FingerPaint
//
//  Created by Howard Yeh on 2014-09-15.
//  Copyright (c) 2014 Howard Yeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var canvasView : CanvasView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Error: will release the CanvasView immediately after assignment
        // self.canvasView = CanvasView(frame: self.view.bounds)
        let canvasView = CanvasView(frame: self.view.bounds)
        self.canvasView = canvasView
        self.canvasView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.canvasView)

        setupColorPickers()
    }

    func setupColorPickers() {
        // Or pick any color scheme that you like: https://kuler.adobe.com/explore/most-popular/
        let colors : [UIColor] = [0x000000,0x17A3A5,0x8DBF67,0xFCCB5F,0xFC6E59]

        let positions = [
            (33,43),(86,43),(138,43),(190,43),(242,43)
        ]
        let size = (44,44)

        for (i,position) in enumerate(positions) {
            let color = colors[i]
            let (x,y) = position
            let (w,h) = size
            let rect = CGRect(x: x, y: y, width: w, height: h)
            let button = UIButton(frame: rect)
            // button.buttonType = UIButtonType.System
            button.backgroundColor = color
            self.view.addSubview(button)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

