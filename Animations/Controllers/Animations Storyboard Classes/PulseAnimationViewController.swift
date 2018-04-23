//
//  PulseAnimationViewController.swift
//  Animations
//
//  Created by Matheus Gustavo dos Santos Vechietin on 19/04/2018.
//  Copyright © 2018 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit

class PulseAnimationViewController: UIViewController {
    
    var shapeLayer = CAShapeLayer()
    var pulsatingLayer = CAShapeLayer()
    let circularPath = UIBezierPath()
    var isAnimating = false
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Iniciar"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = UIColor.white
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return label
    }()
    
    @IBOutlet var gestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroundColor
        
        circularPath.addArc(withCenter: .zero, radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        shapeLayer = setupCircularShapes(shapeLayer, UIColor.outlineStrokeColor, 1, UIColor.backgroundColor)
        pulsatingLayer = setupCircularShapes(pulsatingLayer, UIColor.pulsatingFillColor, 0, UIColor.pulsatingFillColor)
        textLabel.center = view.center
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        
        gestureRecognizer.addTarget(self, action: #selector(handleTapGesture))
        
        view.layer.addSublayer(pulsatingLayer)
        view.layer.addSublayer(shapeLayer)
        view.addSubview(textLabel)
    }
    
    @objc private func handleTapGesture() {
        if isAnimating {
            stopAnimatePulsatingLayer()
        } else {
            startAnimatePulsatingLayer()
        }
    }
    
    func startAnimatePulsatingLayer() {
        textLabel.text = "Parar"
        isAnimating = true
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 1.4
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        pulsatingLayer.add(animation, forKey: "pulsing")
    }
    
    func stopAnimatePulsatingLayer() {
        textLabel.text = "Iniciar"
        isAnimating = false
        pulsatingLayer.removeAllAnimations()
    }
    
    func setupCircularShapes(_ shapeLayer: CAShapeLayer, _ color: UIColor, _ strokeEnd: Int, _ backgroundColor: UIColor) -> CAShapeLayer {
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = backgroundColor.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.strokeEnd = CGFloat(strokeEnd)
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.position = view.center
        return shapeLayer
    }
}
