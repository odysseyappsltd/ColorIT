//
//  ColorView.swift
//  ColoringBook
//
//  Created by MacBook Pro on 12/28/16.
//  Copyright © 2016 Odyssey. All rights reserved.
//

import UIKit


@IBDesignable class customWhellView: UIView {
    
    //@IBInspectable var counterColor: UIColor = UIColor(hue: CGFloat(0.3), saturation: CGFloat(0.5), brightness: CGFloat(0.5), alpha: 1.0)
    @IBInspectable var shadow: UIColor = UIColor.blue
    var colorArray = [UIColor]()
    var diffArray = [CGFloat]()
    
    override func draw(_ rect: CGRect) {
        
        
        // Add Color to the Array
        //        colorArray.append(UIColor.white)
        //        colorArray.append(UIColor.white)
        //        colorArray.append(UIColor.white)
        //        colorArray.append(UIColor.white)
        //        colorArray.append(UIColor.white)
        //        colorArray.append(UIColor.white)
        //        colorArray.append(UIColor.white)
        //        colorArray.append(UIColor.white)
        
        //counterColor = colorArray[0]
        // Draw Each angle to the View
        diffArray.append(1.375 * π)
        diffArray.append(1.625 * π)
        diffArray.append(1.875 * π)
        diffArray.append(0.125 * π)
        diffArray.append(0.375 * π)
        diffArray.append(0.625 * π)
        diffArray.append(0.875 * π)
        diffArray.append(1.125 * π)
        diffArray.append(1.375 * π)
        
        // 1
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        print(center)
        
        // 2
        let radius: CGFloat = max(bounds.width-25, bounds.height-25)
        print(radius)
        
        // 3
        let arcWidth: CGFloat = 60//76
        
        // 4
        //let startAngle: CGFloat = π / 3
        //print(startAngle)
        //let endAngle: CGFloat = (π / 3) - 0.00000000000001
        //print(endAngle)
        
        //        // 5
        //        let path = UIBezierPath(arcCenter: center,
        //                                radius: radius/2 - arcWidth/2,
        //                                startAngle: startAngle,
        //                                endAngle: endAngle,
        //                                clockwise: true)
        //
        //        print(path)
        //
        //        // 6
        //        path.lineWidth = arcWidth
        //        counterColor.setStroke()
        //        path.stroke()
        
        
        print("asdf \(radius/2 - arcWidth/2)")
        var path = UIBezierPath(arcCenter: center, radius: bounds.width/2, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi*2), clockwise: true)
        
        path.lineWidth = arcWidth
        
        shadow.setFill()
        path.fill()
        
        
        
        
        
        for index in 0..<colorArray.count {
            
            let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: diffArray[index], endAngle: diffArray[index + 1], clockwise: true)
            
            path.lineWidth = arcWidth
            colorArray[index].setStroke()
            path.stroke()
        }
        
        for index in 0..<colorArray.count {
            
            if colorArray[index] == UIColor.white
            {
                
                let path = UIBezierPath(arcCenter: center, radius: radius/2, startAngle: diffArray[index], endAngle: diffArray[index + 1], clockwise: true)
                
                path.addArc(withCenter: center, radius: 0, startAngle: diffArray[index], endAngle: diffArray[index+1], clockwise: true)
                path.close()
                
                path.lineWidth = 1
                let dashes: [CGFloat] = [path.lineWidth * 6, path.lineWidth * 10]
                path.setLineDash(dashes, count: dashes.count, phase: 0)
                path.lineCapStyle = CGLineCap.square
                UIColor.gray.setStroke()
                path.stroke()
            }
        }
        
        
        path = UIBezierPath(arcCenter: center, radius: 41, startAngle: 0, endAngle: 2*π , clockwise: true)
        
        path.lineWidth = 2
        UIColor.gray.setStroke()
        path.stroke()
        
        
        
        /*print("asdf \(radius/2 - arcWidth/2)")
         let path = UIBezierPath(arcCenter: center, radius: CGFloat(20), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi*2), clockwise: true)
         //let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 50)
         path.lineWidth = arcWidth
         UIColor.red.setFill()
         path.fill()*/
        //UIColor.red.setStroke()
        //path.stroke()
        
        //        let startAngle: CGFloat = π / 3
        //        //print(startAngle)
        //        let endAngle: CGFloat = (π / 3) - 0.00000000000001
        //        //print(endAngle)
        //
        //
        //        // 1
        //        let radiusBorder: CGFloat = max(bounds.width, bounds.height)
        //        print(radius)
        //
        //        // 2
        //        let arcWidthBorder: CGFloat = 3
        //
        //        // 3
        //        let path = UIBezierPath(arcCenter: center, radius: radiusBorder/2 - arcWidthBorder/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        //
        //        path.lineWidth = arcWidthBorder
        //        colorArray[0].setStroke()
        //        path.stroke()
        
    }
    func sind(x: CGFloat)->CGFloat{
        return (max(bounds.width-25, bounds.height-25)/2)*sin(x*π/180)
    }
    func cosd(x: CGFloat)->CGFloat{
        return (max(bounds.width-25, bounds.height-25)/2)*cos(x*π/180)
    }
}
