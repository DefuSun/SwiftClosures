//
//  NextView.swift
//  Swift 闭包 实例
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 sundefu. All rights reserved.
//

import UIKit

//定义闭包函数类型
typealias sendValueClosure = (string:String, isClose: Bool)->Void
typealias closeClosure = () -> Void

class NextView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    //声明一个闭包
    var myClosure:sendValueClosure?
    var myCloseClosure:closeClosure?
    
    var textFiled:UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        makeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //声明一个函数指针为参数的 函数，用来传递上个界面的函数指针 将该函数指针负值给myClosure闭包，该函数在上个界面调用，可以传递多个
    func initWithClosure(closure:sendValueClosure?, close:() -> Void){
        
        myClosure = closure
        myCloseClosure = close
    }
    
    
    
    func makeView() -> Void {
        textFiled = UITextField.init(frame: CGRectMake(20, 60, self.frame.size.width - 40, 44))
        textFiled.backgroundColor = UIColor .yellowColor()
        textFiled.returnKeyType = .Done
        textFiled.placeholder = "随便输入"
        self.addSubview(textFiled)
        
        let button = UIButton.init(type: .Custom)
        button.frame = CGRectMake((self.frame.size.width - 200)/2, CGRectGetMaxY(textFiled.frame) + 30, 80, 44)
        button.setTitle("确定", forState: .Normal)
        button.backgroundColor = UIColor .greenColor()
        self.addSubview(button)
        button.addTarget(self, action: #selector(NextView.buttonClick(_:)), forControlEvents: .TouchUpInside)
        
        let closeButton = UIButton.init(type: .Custom)
        closeButton.frame = CGRectMake(CGRectGetMaxX(button.frame)+40, CGRectGetMaxY(textFiled.frame) + 30, 80, 44)
        closeButton.setTitle("关闭", forState: .Normal)
        closeButton.backgroundColor = UIColor .greenColor()
        self.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(NextView.closeButtonClick(_:)), forControlEvents: .TouchUpInside)
        
    }
    
    func buttonClick(sender:UIButton) -> Void {
        
        if myClosure != nil {
            myClosure!(string: textFiled!.text!, isClose: true)
        }
    }
    
    func closeButtonClick(sender:UIButton) -> Void {
        
        if (myCloseClosure != nil) {
            myCloseClosure!()
        }
    }
    
}
