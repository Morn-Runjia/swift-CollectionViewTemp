//
//  MyCollectionViewCell.swift
//  swift-CollectionViewTemp
//
//  Created by 李润嘉 on 16/7/21.
//  Copyright © 2016年 李润嘉. All rights reserved.
//

import UIKit


class MyCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.iconImageView.frame = CGRectMake(frame.size.width / 3, frame.size.height / 3, frame.size.width / 3, frame.size.height / 3)
        //iconImageView.frame.origin.y
        self.titleLabel.frame = CGRectMake(0, iconImageView.frame.origin.y + iconImageView.frame.size.height + 5, frame.size.width, 15)
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.titleLabel)
        
    }
    //不太清楚是什么的指定构造器 - =
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "标题"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(10)
        return label
    }()
    
    var iconImageView : UIImageView = {
        
        let imageView  = UIImageView()
        return imageView
    }()
}
