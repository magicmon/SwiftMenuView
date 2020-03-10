//
//  UIView+Extension.swift
//  SwiftMenuView
//
//  Created by magicmon on 2020/03/10.
//  Copyright © 2020 magicmon. All rights reserved.
//

import UIKit

extension UIView {
    @discardableResult
    func setup(forNibName nibName: String, on parentView: UIView? = nil) -> UIView {
        let nib = UINib(nibName: nibName, bundle: nil)
        
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            (parentView ?? self).addSubview(view)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
            
            return view
        } else {
            fatalError("Failed to load nib resource with name: \(nibName)")
        }
    }
    
    func setupForNibName() {
        setup(forNibName: String(describing: "\(type(of: self))"))
    }
}
