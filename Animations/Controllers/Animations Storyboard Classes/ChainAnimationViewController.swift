//
//  ViewController.swift
//  Animations
//
//  Created by Matheus Gustavo dos Santos Vechietin on 19/04/2018.
//  Copyright © 2018 Matheus Gustavo dos Santos Vechietin. All rights reserved.
//

import UIKit

class ChainAnimationViewController: UIViewController {
    
    @IBOutlet weak var myStackView = UIStackView()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapAnimation))
        titleLabel.text = "Bem-vindo App Animations"
        bodyLabel.text = "Esse app tem como intuito mostrar as possíveis animações que podemos criar usando swift."
    }
    
    @objc func handleTapAnimation() {
        //Title Label
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        //Body Label
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
    }
}
