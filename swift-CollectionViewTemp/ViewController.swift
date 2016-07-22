//
//  ViewController.swift
//  swift-CollectionViewTemp
//
//  Created by 李润嘉 on 16/7/21.
//  Copyright © 2016年 李润嘉. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let screenWidth = UIScreen.mainScreen().bounds.width
    let screenHeight = UIScreen .mainScreen().bounds.height
    let idenContentString = "idenContentString"


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //单个滚动视图
        self.automaticallyAdjustsScrollViewInsets = true
        
        self.makeUICollectionView()
        
    }
    func makeUICollectionView() {
        //设置 Layout
        let layout = UICollectionViewFlowLayout.init()
        //滚动方向
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        //间隔
        let spacing:CGFloat = 1
        //水平间隔
        layout.minimumInteritemSpacing = spacing
        //垂直行间距
        layout.minimumLineSpacing = spacing
        
        //列数
        let columnsNum = 4
        //计算单元格的宽度
        let itemWidth = (screenWidth - spacing * CGFloat(columnsNum - 1)) / CGFloat(columnsNum)
        //设置单元格宽度和高度
        layout.itemSize = CGSizeMake(itemWidth, itemWidth)
        
        //设置collectionView
        let myCollectionView : UICollectionView = UICollectionView(frame: CGRectMake(0, 200, screenWidth, (screenWidth / 4) * 3 + 2), collectionViewLayout: layout)
        myCollectionView.collectionViewLayout = layout
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.backgroundColor = UIColor.lightGrayColor()
        myCollectionView.registerClass(MyCollectionViewCell.self, forCellWithReuseIdentifier: idenContentString)
        self.view.addSubview(myCollectionView)
        
    }
    //MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(idenContentString, forIndexPath: indexPath) as! MyCollectionViewCell
        
        if indexPath.row <= 9 {
            var titleArray = ["订单", "购物车", "优惠券", "积分商城", "收藏", "我的攻略", "邀请好友", "设置", "消息", "商户入驻"]
            //标题
            cell.titleLabel.text = titleArray[indexPath.row]
            
            cell.iconImageView.image = UIImage.init(named: "icon_\(indexPath.row)")
        }
        else
        {
            //后两个空出来
            cell.titleLabel.text = nil
            cell.iconImageView.backgroundColor = UIColor.clearColor()
        }
        cell.backgroundColor = UIColor.whiteColor()

        return cell
    }
    
    
    //MARK:UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //点击的哪一个
        print("tap -- \(indexPath.row)")
    }
    
    //MARK:UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(1, 0, 5, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

