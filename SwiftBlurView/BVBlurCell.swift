//
//  BVBlurCell.swift
//  SwiftBlurView
//
//  Created by luomeng on 2019/3/11.
//  Copyright © 2019年 comp. All rights reserved.
//

import UIKit

class BVBlurCell: UITableViewCell {

    public var bluredImgView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        bluredImgView = UIImageView(frame: self.bounds)
        bluredImgView.contentMode = .scaleAspectFill
        self.contentView.addSubview(bluredImgView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bluredImgView.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = UIColor.white
        
        bluredImgView = UIImageView(frame: self.bounds)
        bluredImgView.contentMode = .scaleAspectFill
        self.contentView.addSubview(bluredImgView)
    }
    
    public func configBlurImage() {
        self.bluredImgView.frame = self.bounds
        
        self.bluredImgView.isHidden = true
        UIGraphicsBeginImageContext(self.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            self.contentView.layer.render(in: context)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.bluredImgView.isHidden = false
        
        let img = image?.applyBlurWithRadius(2, tintColor: UIColor(white: 1, alpha: 0.1), saturationDeltaFactor: 1.0, maskImage: nil)
        self.bluredImgView.image = img
    }

}
