//
//  CustomBubbleView.swift
//  CustomBubbleView
//
//  Created by Duncan Champney on 11/21/23.
//

import UIKit
import CoreGraphics

class CustomBubbleView: UIView {
    
    let radius: CGFloat = 10.0
    let triangleRadius = 5.0
    let triangleWidth: CGFloat = 30
    let triangleHeight: CGFloat = 30


    var shapeLayer = CAShapeLayer()
    
    override var bounds: CGRect {
        didSet {
            print("In didSet")
            shapeLayer.frame = bounds
//            shapeLayer.frame = bounds.insetBy(dx: 10, dy: 10)
            shapeLayer.path = path
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        // Custom initialization
        backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
        layer.addSublayer(shapeLayer)
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 2
    }
    
    var path: CGPath  {
        let cgPath = CGMutablePath()
        
        cgPath.move(to: CGPoint(x: triangleWidth, y: shapeLayer.bounds.height/2 + triangleHeight/2))
        cgPath.addArc(center: CGPoint(x: triangleWidth + radius, y: shapeLayer.bounds.height - radius),
                      radius: radius,
                      startAngle: CGFloat.pi,
                      endAngle: CGFloat.pi / 2,
                      clockwise: true,
                      transform: .identity)
        
        cgPath.addArc(center: CGPoint(x: shapeLayer.bounds.width - radius, y: shapeLayer.bounds.height - radius),
                      radius: radius,
                      startAngle: CGFloat.pi / 2,
                      endAngle: 0,
                      clockwise: true,
                      transform: .identity)
        cgPath.addArc(center: CGPoint(x: shapeLayer.bounds.width - radius, y: radius),
                      radius: radius,
                      startAngle: 0,
                      endAngle: 3 * CGFloat.pi / 2,
                      clockwise: true,
                      transform: .identity)
        
        cgPath.addArc(center: CGPoint(x: triangleWidth + radius, y: radius),
                      radius: radius,
                      startAngle: 3 * CGFloat.pi / 2,
                      endAngle: CGFloat.pi,
                      clockwise: true,
                      transform: .identity)
        cgPath.addLine(to: CGPoint(x: triangleWidth, y: shapeLayer.bounds.height / 2 - triangleHeight / 2))
        
        cgPath.addArc(tangent1End: CGPoint(x: 0, y: shapeLayer.bounds.height / 2), tangent2End: CGPoint(x: triangleWidth, y: shapeLayer.bounds.height / 2 + triangleHeight / 2), radius: triangleRadius)
        cgPath.addLine(to: CGPoint(x: triangleWidth, y: shapeLayer.bounds.height / 2 + triangleHeight / 2))

        return cgPath
    }
     /*
    override func draw(_ rect: CGRect) {
        let radius: CGFloat = 10
        let triangleWidth: CGFloat = 20
        let triangleHeight: CGFloat = 20

        // Create the path for the triangle and the rounded rectangle
        let path = UIBezierPath()

        // Start with the triangle part
        path.move(to: CGPoint(x: triangleWidth, y: rect.height / 2 - triangleHeight / 2))
        path.addLine(to: CGPoint(x: 0, y: rect.height / 2))
        path.addLine(to: CGPoint(x: triangleWidth, y: rect.height / 2 + triangleHeight / 2))

        // Continue with the rounded rectangle part
        path.addLine(to: CGPoint(x: triangleWidth, y: rect.height - radius))
        path.addArc(withCenter: CGPoint(x: triangleWidth + radius, y: rect.height - radius),
                    radius: radius,
                    startAngle: CGFloat.pi,
                    endAngle: CGFloat.pi / 2,
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.width - radius, y: rect.height))
        path.addArc(withCenter: CGPoint(x: rect.width - radius, y: rect.height - radius),
                    radius: radius,
                    startAngle: CGFloat.pi / 2,
                    endAngle: 0,
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.width, y: radius))
        path.addArc(withCenter: CGPoint(x: rect.width - radius, y: radius),
                    radius: radius,
                    startAngle: 0,
                    endAngle: -CGFloat.pi / 2,
                    clockwise: false)
        path.addLine(to: CGPoint(x: triangleWidth + radius, y: 0))
        path.addArc(withCenter: CGPoint(x: triangleWidth + radius, y: radius),
                    radius: radius,
                    startAngle: -CGFloat.pi / 2,
                    endAngle: -CGFloat.pi,
                    clockwise: false)
        path.close()

        // Set the stroke color to gray
        UIColor.gray.setStroke()

        // Set the fill color to white
        UIColor.white.setFill()

        // Draw the filled path
        path.fill()

        // Draw the path with stroke
        path.stroke()
    }
*/
}
