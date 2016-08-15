//
//  ViewController.swift
//  Swift 闭包 实例
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 sundefu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.orangeColor()
        
        label = UILabel.init(frame: CGRectMake(100, 160, 170, 44))
        label.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(label)
        
        let button = UIButton.init(type: .Custom)
        button.frame = CGRectMake(120, CGRectGetMaxY(label.frame) + 30, 100, 44)
        button.setTitle("下一步", forState: .Normal)
        button.backgroundColor = UIColor .greenColor()
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(ViewController.nextClick(_:)), forControlEvents: .TouchUpInside)
        
    }
    
    var nextView:NextView?
    var bgNexView:UIView?
    
    func nextClick(sender:UIButton) -> Void {
        //创建nextView
        createNextView()
    }
    
    func createNextView() -> Void {
        bgNexView = UIView.init(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        bgNexView!.backgroundColor = UIColor .blackColor()
        bgNexView!.alpha = 0.3
        self.view.addSubview(bgNexView!)
        
        let view_W = self.view.frame.size.width - 100.0
        nextView = NextView.init(frame: CGRectMake(50, 220, view_W, view_W))
        nextView!.initWithClosure({ (string, isClose) in
            self.label.text = string
            if isClose {
                self.closeNextView()
            }
            }) { 
                self.closeNextView()
        }
        self.view.addSubview(nextView!)
        
    }
    
    func closeNextView() -> Void {
        bgNexView?.removeFromSuperview()
        bgNexView = nil
        
        nextView?.removeFromSuperview()
        nextView = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/*
 闭包 从 A --> B
 1.在B中 使用typealias 定义一个函数类型 并声明一个闭包myClosure
 2.在B中定义一个方法，在A中调用 该函数的参数是闭包同类型的函数指针
 3.在B中调用闭包myClosure 在A中实现该方法
 
 */





