//
//  ViewController.swift
//  PostWeiboAnimation
//
//  Created by 4wd-ios on 2017/9/12.
//  Copyright © 2017年 szd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var btnsArr : [UIButton] = []
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBtns()
    }
    
    //点击发布弹出
    
    @IBAction func postClick(_ sender: Any) {
        for item in btnsArr.enumerated() {
            let btn = item.element
            
            let delayTime = CGFloat(item.offset)*0.2
            
            /*参数说明
             withDuration：动画持续时长
             delay：动画开始前等待的时间
             usingSpringWithDamping：阻尼，范围0-1，如果初始速度较小阻尼为1时没有效果，初始速度较高时间较短时，则会有回弹效果
             initialSpringVelocity：初始速度
             options：动画执行的方式
             */
            UIView.animate(withDuration: 0.8, delay: TimeInterval(delayTime), usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .layoutSubviews, animations: {
                btn.frame = CGRect(x: btn.frame.origin.x, y: btn.frame.origin.y-200, width: 50, height: 50)
            }, completion: nil)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        for item in btnsArr.enumerated() {
            let btn = item.element
            
            let delayTime = CGFloat(item.offset)*0.2
            
            UIView.animate(withDuration: 0.8, delay: TimeInterval(delayTime), usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .layoutSubviews, animations: {
                btn.frame = CGRect(x: btn.frame.origin.x, y: self.screenHeight+50, width: 50, height: 50)
            }, completion: nil)
        }
    }
    
    func setUpBtns() {
        
        let nameArr = ["文章","图片","视频"]
        
        let edge = (screenWidth-150)/4
        
        for item in nameArr.enumerated() {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: edge+(edge+50)*CGFloat(item.offset), y: screenHeight+50, width: 50, height: 50)
            btn.backgroundColor = UIColor(red: CGFloat(100*item.offset)/255.0, green: CGFloat(100*item.offset)/255.0, blue: 1.0, alpha: 1.0)
            btn.setTitle(item.element, for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 25.0
            btnsArr.append(btn)
            self.view.addSubview(btn)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

