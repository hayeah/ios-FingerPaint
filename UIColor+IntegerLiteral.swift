//
//  UIColor+Literal.swift
//  FingerPaint
//
//  Created by Howard Yeh on 2014-09-17.
//  Copyright (c) 2014 Howard Yeh. All rights reserved.
//

import Foundation
import UIKit
// Borrowed from @mattt's Literally
// https://github.com/mattt/Literally/blob/d0f0173960f6ab717048a9310737627572992b0d/Literally.swift#L184-L193


// looks like the literal mechanism changed:
// https://github.com/owensd/json-swift/blob/master/src/JSValue.Literals.swift


//extension UIColor: IntegerLiteralConvertible {
//    public convenience init(integerLiteral value: IntegerLiteralType) {
//
//        let red = CGFloat((value & 0xFF0000) >> 16) / 255.0
//        let green = CGFloat((value & 0x00FF00) >> 8) / 255.0
//        let blue = CGFloat(value & 0x0000FF) / 255.0
//        let alpha = CGFloat(1.0)
//
//        self.init(red: red, green: green, blue: blue, alpha: alpha)
//
////        super.init
////
////        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
//    }
//}
