//
//  LBshowMessage.swift
//  封装
//
//  Created by sm on 17/1/3.
//  Copyright © 2017年 sm. All rights reserved.
//

import UIKit


///屏幕 高度
let ScreenH = UIScreen.main.bounds.height
///屏幕高度
let ScreenW = UIScreen.main.bounds.width
/*
 * tagert: 需要加在哪个view上
 * message: 展示的消息
 * dispatchTime: 多少时间后移除
 * viewCenter: 弹出框展示位置
 * imagestr: 弹出框展示的图片
 */
class LBshowMessage: NSObject {

    class func showMydefineMessage (tagert:AnyObject,message:String,dispatchTime:CGFloat,viewCenter:CGPoint,imagestr:String){
        
        let statusLabelText: NSString = message as NSString
        let size = CGSize(width: 200, height: CGFloat(MAXFLOAT))
        let dic = NSDictionary(object: UIFont.systemFont(ofSize: 14), forKey: NSFontAttributeName as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        
        var view:UIView!
        view=UIView(frame:CGRect(x: (ScreenW-strSize.width - 40)/2, y: (ScreenH - 60 - strSize.height)/2 - 20, width: strSize.width + 40, height: 80 + strSize.height))
        if viewCenter.x != 0 || viewCenter.y != 0 {
            view.center = viewCenter
        }
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        let image = UIImageView(frame:CGRect(x: (strSize.width + 40 - 45)/2, y: 10, width: 45, height: 40))
        image.image = UIImage(named:imagestr)
        image.contentMode = UIViewContentMode.scaleAspectFit
        
        let label = UILabel(frame:CGRect(x: 20, y: image.frame.maxY + 7, width: strSize.width, height: strSize.height))
        label.text = message as String
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor=UIColor.clear
        label.numberOfLines = 0
        label.textAlignment=NSTextAlignment.center
        
        view.addSubview(image)
        view.addSubview(label)
        
        tagert.addSubview(view)
        
        let delay = DispatchTime.now() + DispatchTimeInterval.seconds(1);
        
        UIView.animate(withDuration: 0.5, animations: {
            view.transform=CGAffineTransform(scaleX: 0.8, y: 0.8);
            
        }) { (complete) in
            if complete == true{
                
                DispatchQueue.main.asyncAfter(deadline: delay) {
                    
                    UIView.animate(withDuration: TimeInterval(dispatchTime), animations: {
                        view.alpha = 0
                        image.alpha = 0
                        label.alpha = 0
                        }, completion: { (complete) in
                            if complete == true{
                                view.removeFromSuperview()
                                image.removeFromSuperview()
                                label.removeFromSuperview()
                                
                            }
                    })
                }
            }
        }
    }
}
