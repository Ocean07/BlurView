//
//  MyContentCell.swift
//  SwiftBlurView
//
//  Created by luomeng on 2019/3/11.
//  Copyright © 2019年 comp. All rights reserved.
//

import UIKit

class MyContentCell: BVBlurCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let btn = UIButton(frame: CGRect(x: 150, y: 10, width: 80, height: 35))
        btn.setTitle("Button", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        self.bluredImgView.addSubview(btn)
    }
    
    public func showContent() {
        
        self.imgView.image = UIImage(named: "ic_photo")
        
        self.label.text = "selfimage"
        
        if arc4random() % 2 == 0 {
            self.configBlurImage()
        }
    }
    
}
