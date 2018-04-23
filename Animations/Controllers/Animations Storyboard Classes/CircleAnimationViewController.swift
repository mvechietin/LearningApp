//
//  CircleAnimationViewController.swift
//  Animations
//
//  Created by Matheus Gustavo dos Santos Vechietin on 20/04/2018.
//  Copyright © 2018 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit

class CircleAnimationViewController: UIViewController, URLSessionDownloadDelegate {
    
    var shapeLayer = CAShapeLayer()
    var trackLayer = CAShapeLayer()
    let circularPath = UIBezierPath()
    
    let urlString = "https://firebasestorage.googleapis.com/v0/b/firestorechat-e64ac.appspot.com/o/intermediate_training_rec.mp4?alt=media&token=e20261d0-7219-49d2-b32d-367e1606500c"
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Iniciar"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = UIColor.trackStrokeColor
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return label
    }()
    
    @IBOutlet var gestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor
        circularPath.addArc(withCenter: .zero, radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        shapeLayer = setupCircularShapes(shapeLayer, UIColor.outlineStrokeColor, 0)
        trackLayer = setupCircularShapes(trackLayer, UIColor.trackStrokeColor, 1)
        gestureRecognizer.addTarget(self, action: #selector(handleTapGesture))
        percentageLabel.center = view.center
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        
        view.addSubview(percentageLabel)
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentage = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            self.percentageLabel.text = "\(Int(percentage * 100))%"
            self.shapeLayer.strokeEnd = CGFloat(percentage)
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("")
    }
    
    fileprivate func setupAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    private func beginDownloadFile() {
        shapeLayer.strokeEnd = 0
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        
        guard let url = URL(string: urlString) else { return }
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
    
    @objc private func handleTapGesture() {
//        setupAnimation()
        beginDownloadFile()
    }
    
    func setupCircularShapes(_ shapeLayer: CAShapeLayer, _ color: UIColor, _ strokeEnd: Int) -> CAShapeLayer {
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = CGFloat(strokeEnd)
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.position = view.center
        
        return shapeLayer
    }
}
