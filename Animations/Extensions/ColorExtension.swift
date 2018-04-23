//
//  ColorExtension.swift
//  Animations
//
//  Created by Matheus Gustavo dos Santos Vechietin on 20/04/2018.
//  Copyright © 2018 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let backgroundColor = UIColor.rgb(r: 46, g: 46, b: 46)
    static let outlineStrokeColor = UIColor.rgb(r: 234, g: 46, b: 111)
    static let trackStrokeColor = UIColor.rgb(r: 220, g: 220, b: 220)
    static let pulsatingFillColor = UIColor.rgb(r: 86, g: 30, b: 63)
}
