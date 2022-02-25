//
//  boundImageView.swift
//  Tipster
//
//  Created by Chen Hanrui on 2022/2/24.
//

import UIKit

class boundImageView: UIImageView {
    
    let imageView: UIImageView = UIImageView(image: self)
    let layer = imageView.layer
    imageView.layer.masksToBounds = true
    imageView.layer.borderWidth = 1.5
    imageView.layer.borderColor = UIColor.white.cgColor
    imageView.layer.cornerRadius = imageView.bounds.width / 2

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
