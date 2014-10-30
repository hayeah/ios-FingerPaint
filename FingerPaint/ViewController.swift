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
    weak var selectedColorPicker: UIButton?
    weak var clearButton: UIButton!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Error: will release the CanvasView immediately after assignment
        // self.canvasView = CanvasView(frame: self.view.bounds)
        let canvasView = CanvasView(frame: self.view.bounds)
        self.canvasView = canvasView
        self.canvasView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.canvasView)

        setupColorPickers()
        setupClearButton()
    }

    func setupColorPickers() {
        // Or pick any color scheme that you like: https://kuler.adobe.com/explore/most-popular/
//        let colors : [UIColor] = [
//            0x000000
//            0x17A3A5,
//            0x8DBF67,
//            0xFCCB5F,
//            0xFC6E59
//        ]

        let colors : [UIColor] = [
            // 0x000000
            UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            // 0x17A3A5
            UIColor(red: 0x17/255.0, green: 0xA3/255.0, blue: 0xA5/255.0, alpha: 1),
            // 0x8DBF67
            UIColor(red: 0x8D/255.0, green: 0xBF/255.0, blue: 0x67/255.0, alpha: 1),
            // 0xFCCB5F
            UIColor(red: 0xFC/255.0, green: 0xCB/255.0, blue: 0x5F/255.0, alpha: 1),
            // 0xFC6E59
            UIColor(red: 0xFC/255.0, green: 0x6E/255.0, blue: 0x59/255.0, alpha: 1),
        ]


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
            button.backgroundColor = color
            self.view.addSubview(button)

            button.addTarget(self, action: "colorPickerTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }

    func setupClearButton() {
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.clearButton = button
        button.frame = CGRect(x: 267, y: 518, width: 37, height: 30)
        button.setTitle("Clear", forState: UIControlState.Normal)
        self.view.addSubview(button)

        button.addTarget(self, action: "clearButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
    }

    func clearButtonTapped(button: UIButton) {
        self.canvasView.clear()
    }

    func colorPickerTapped(button: UIButton) {
        // println("tapped: \(button.backgroundColor)")
        if let picker = self.selectedColorPicker {
            picker.layer.shadowRadius = 0
        }
        self.selectedColorPicker = button
        button.layer.shadowColor = UIColor(white: 0.4, alpha: 1).CGColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 1

        self.canvasView.currentColor = button.backgroundColor!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

