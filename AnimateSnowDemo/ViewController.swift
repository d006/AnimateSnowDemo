//
//  ViewController.swift
//  AnimateSnowDemo
//
//  Created by doriswu on 2016/12/16.
//  Copyright © 2016年 doriswu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //let rect = CGRect(x: 0.0, y: self.view.bounds.height, width: view.bounds.width, height: 50.0)//下往上
        let rect = CGRect(x: 0.0, y: -70, width: view.bounds.width,
                          height: 50.0)//上往下
        
        let emitter = CAEmitterLayer()
        emitter.frame = rect
        emitter.emitterShape = kCAEmitterLayerRectangle
        
        emitter.emitterPosition = CGPointMake(rect.width/2, rect.height/2)
        emitter.emitterSize = rect.size
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: "iconSnow")?.CGImage
        emitterCell.birthRate = 10  //每秒产生粒子數
        emitterCell.lifetime = 3   //存活1秒
        emitterCell.lifetimeRange = 100.0
        
        emitter.emitterCells = [emitterCell]  //这里可以设置多种粒子 我们以一种为粒子
        //emitterCell.yAcceleration =  -50.0  //给Y方向一个加速度 向上
        emitterCell.yAcceleration = 50.0 //向下
        emitterCell.xAcceleration = 10.0 //x方向一个加速度
        emitterCell.velocity = 10.0 //初始速度
        emitterCell.emissionLongitude = CGFloat(-M_PI) //向左
        emitterCell.velocityRange = 100.0   //随机速度 -200+20 --- 200+20
        emitterCell.emissionRange = CGFloat(M_PI_2) //随机方向 -pi/2 --- pi/2
        //        emitterCell.color = UIColor(red: 1.0, green: 1.0, blue: 1.0,
        //           alpha: 1.0).CGColor //指定颜色
        emitterCell.redRange = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3  //三个随机颜色
        
        emitterCell.scale = 0.8
        emitterCell.scaleRange = 0.8  //0 - 1.6
        emitterCell.scaleSpeed = -0.05  //逐渐变小
        
        emitterCell.alphaRange = 0.75   //随机透明度
        //emitterCell.alphaSpeed = -0.15  //逐渐消失
        
        self.view.layer.addSublayer(emitter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

