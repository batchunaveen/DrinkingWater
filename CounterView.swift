//
//  CounterView.swift
//  DrinkingWater
//
//  Created by Naveen Batchu on 10/8/17.
//  Copyright © 2017 NaveenInnovations. All rights reserved.
//

import UIKit


@IBDesignable class CounterView: UIView {


    private struct Constants {
     
        static let numberOfGlasses = 8
        static let lineWidth : CGFloat = 5.0
        static let arcWidth : CGFloat = 76
      
        
        static var halfOfLineWidth : CGFloat {
            return lineWidth / 2
        }
    }
    @IBInspectable var counter : Int = 5 {
        didSet{
            if counter <= Constants.numberOfGlasses {
                setNeedsDisplay()
                NSLog("Hey I am Here counter", +counter)
                print(counter)
            }
        }
    }
        @IBInspectable var outlineColor : UIColor = UIColor.blue
        @IBInspectable var counterColor : UIColor = UIColor.orange
        
        override func draw (_ rec: CGRect){
            
            let center  = CGPoint (x:bounds.width/2, y:bounds.height/2)
            let radius  :  CGFloat = max(bounds.width,bounds.height)
            let startAngle : CGFloat = 3 * .pi / 4
            let endAngle : CGFloat = .pi / 4
            let path = UIBezierPath(arcCenter : center,
                                      radius  : radius/2 - Constants.arcWidth/2,
                                      startAngle : startAngle,
                                      endAngle: endAngle,
                                      clockwise : true)
            
            
            path.lineWidth = Constants.arcWidth
            counterColor.setStroke()
            path.stroke()
            
            
            //Outline
            let angleDifference : CGFloat = 2  * .pi - startAngle + endAngle
            let arcLenthPerGlass = angleDifference /  CGFloat(Constants.numberOfGlasses)
            let outlineEndAngle = arcLenthPerGlass * CGFloat(counter) + startAngle
            
            let outlinePath = UIBezierPath(arcCenter : center,
                                            radius: bounds.width / 2 - Constants.halfOfLineWidth,
                                            startAngle: startAngle,
                                            endAngle: outlineEndAngle,
                                            clockwise: true)
                outlinePath.addArc(withCenter: center,
                                    radius: bounds.width / 2 - Constants.arcWidth + Constants.halfOfLineWidth,
                                    startAngle: outlineEndAngle,
                                    endAngle: startAngle,
                                    clockwise: false)
            
            outlinePath.close()
            
            outlineColor.setStroke()
            outlinePath.lineWidth  = Constants.lineWidth
            outlinePath.stroke()
        
            
        }
    
    
}
