//
//  ViewController.swift
//  12.1-InfiniteMoving
//
//  Created by Alehandro on 19.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var width: CGFloat = 100
    private var height: CGFloat = 100
    private var customView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        customView = UIView(frame: CGRect(x: UIScreen.main.bounds.midX - width / 2,
                                              y: UIScreen.main.bounds.midY - height,
                                              width: width,
                                              height: height))
        customView.backgroundColor = .systemRed
        customView.layer.cornerRadius = width / 2
        self.view.addSubview(customView)
        
        
        let timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector:#selector(animation) , userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc private func animation() {
        UIView.animate(withDuration: 1, delay: 0, options: []) {
            self.customView.frame = CGRect(x: UIScreen.main.bounds.midX + self.width,
                                      y: UIScreen.main.bounds.midY - self.height,
                                      width: self.width,
                                      height: self.height)
            self.customView.backgroundColor = .systemYellow
        } completion: { _ in
            UIView.animate(withDuration: 1, delay: 0, options: []) {
                self.customView.frame = CGRect(x: UIScreen.main.bounds.midX + self.width,
                                          y: UIScreen.main.bounds.midY,
                                          width: self.width,
                                          height: self.height)
                self.customView.backgroundColor = .systemRed
            } completion: { _ in
                UIView.animate(withDuration: 1, delay: 0, options: []) {
                    self.customView.frame = CGRect(x: UIScreen.main.bounds.midX - self.width * 2,
                                              y: UIScreen.main.bounds.midY,
                                              width: self.width,
                                              height: self.height)
                    self.customView.backgroundColor = .systemYellow
                } completion: { _ in
                    UIView.animate(withDuration: 1, delay: 0, options: []) {
                        self.customView.frame = CGRect(x: UIScreen.main.bounds.midX - self.width * 2,
                                                  y: UIScreen.main.bounds.midY - self.height,
                                                  width: self.width,
                                                  height: self.height)
                        self.customView.backgroundColor = .systemRed
                    }
                }
            }
        }
    }
}
        
        

