//
//  MenuView.swift
//  SwiftMenuView
//
//  Created by magicmon on 2020/03/10.
//  Copyright © 2020 magicmon. All rights reserved.
//

import UIKit

class MenuView: UIView {
    
    var closeHandler: (() -> Void)? = nil
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    private func commonInit() {
        setupForNibName()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}

extension MenuView {
    @IBAction func pressedClose() {
        closeHandler?()
    }
}
