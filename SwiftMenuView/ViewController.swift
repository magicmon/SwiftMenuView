//
//  ViewController.swift
//  SwiftMenuView
//
//  Created by magicmon on 2020/03/10.
//  Copyright © 2020 magicmon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var menuView: MenuView!
    @IBOutlet private weak var menuViewLeading: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleMenu(false)
        
        menuView.closeHandler = { [weak self] in
            self?.hideMenu()
        }
    }
    
    @IBAction func pressedMenu(_ sender: UIButton) {
        showMenu()
    }
}

extension ViewController {
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began,. changed:
            let translation = sender.translation(in: self.view).x
            
            let panOffset = self.view.frame.size.width * 0.1
            
            if translation > 0 {    // swipe right
                if self.menuViewLeading.constant < -panOffset {
                    self.menuViewLeading.constant = -(self.menuView.frame.size.width - translation)
                    self.view.layoutIfNeeded()
                } else {
                    self.toggleMenu(true)
                }
            } else {    // swipe left
                if menuViewLeading.constant > -self.view.frame.size.width + panOffset {
                    self.menuViewLeading.constant = translation
                    self.view.layoutIfNeeded()
                } else {
                    self.toggleMenu(false)
                }
            }
        case .ended:
            if menuViewLeading.constant < -(self.view.frame.size.width / 2) {
                UIView.animate(withDuration: 0.2) { [weak self] in
                    self?.toggleMenu(false)
                }
            } else {
                UIView.animate(withDuration: 0.2) { [weak self] in
                    self?.toggleMenu(true)
                }
            }
        default:
            break
        }
    }
    
    func showMenu(duration: TimeInterval = 0.35, completion: ((Bool) -> Void)? = nil ) {
        UIView.animate(withDuration: duration, animations: { [weak self] in
            self?.toggleMenu(true)
        }, completion: completion)
    }
    
    func hideMenu(duration: TimeInterval = 0.35, completion: ((Bool) -> Void)? = nil ) {
        UIView.animate(withDuration: duration, animations: { [weak self] in
            self?.toggleMenu(false)
        }, completion: completion)
    }
    
    private func toggleMenu(_ isOn: Bool) {
        menuViewLeading.constant = isOn ? 0 : -view.frame.size.width
        view.layoutIfNeeded()
    }
}
