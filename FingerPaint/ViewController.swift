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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

