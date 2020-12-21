//
//  FoldedCornerView.swift
//  FoldedCornerView
//
//  Created by viktart on 12/18/20.
//

import UIKit

open class FoldedCornerView: UIView {
    
    // MARK: - Properties
    
    open var mainColor: UIColor = UIColor.blue {
        didSet {
            setNeedsDisplay()
        }
    }
    open var foldedCornerMask: CACornerMask = [.layerMaxXMinYCorner] {
        didSet {
            setNeedsDisplay()
        }
    }
    open var cornerRadius: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    open var foldedCornerHeight: CGFloat = 17 {
        didSet {
            setNeedsDisplay()
        }
    }
    open var foldedCornerColor: UIColor = UIColor.gray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Drawing
    
    public override func draw(_ rect: CGRect) {
        func drawCorner(cornerCenter: CGPoint,
                        startAngle: CGFloat,
                        endAngle: CGFloat,
                        foldedHypothenuse: (CGPoint, CGPoint),
                        foldedCornerCenter: CGPoint,
                        isFolded: Bool) -> UIBezierPath? {
            if isFolded {
                path.addLine(to: foldedHypothenuse.0)
                path.addLine(to: foldedHypothenuse.1)
                
                let cornerPath = UIBezierPath()
                cornerPath.move(to: foldedHypothenuse.0)
                cornerPath.addLine(to: foldedHypothenuse.1)
                cornerPath.addArc(withCenter: foldedCornerCenter, radius: cornerRadius, startAngle: startAngle + .pi, endAngle: endAngle + .pi, clockwise: true)
                
                return cornerPath
            } else {
                path.addArc(withCenter: cornerCenter, radius: cornerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
                
                return nil
            }
        }
        
        let width = self.bounds.width
        let height = self.bounds.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: foldedCornerHeight, y: 0))
        
        var foldedCorners: [UIBezierPath?] = []
        foldedCorners.reserveCapacity(4)
        
        foldedCorners.append( // top right
            drawCorner(cornerCenter: CGPoint(x: width - cornerRadius, y: cornerRadius),
                       startAngle: 3 * .pi / 2,
                       endAngle: 2 * .pi,
                       foldedHypothenuse: (CGPoint(x: width - foldedCornerHeight, y: 0), CGPoint(x: width, y: foldedCornerHeight)),
                       foldedCornerCenter: CGPoint(x: width - foldedCornerHeight + cornerRadius, y: foldedCornerHeight - cornerRadius),
                       isFolded: foldedCornerMask.contains(.layerMaxXMinYCorner))
        )
        
        foldedCorners.append( // bottom right
            drawCorner(cornerCenter: CGPoint(x: width - cornerRadius, y: height - cornerRadius),
                       startAngle: 0,
                       endAngle: .pi / 2,
                       foldedHypothenuse: (CGPoint(x: width, y: height - foldedCornerHeight), CGPoint(x: width - foldedCornerHeight, y:height)),
                       foldedCornerCenter: CGPoint(x: width - foldedCornerHeight + cornerRadius, y: height - foldedCornerHeight + cornerRadius),
                       isFolded: foldedCornerMask.contains(.layerMaxXMaxYCorner))
        )
        
        foldedCorners.append( // bottom left
            drawCorner(cornerCenter: CGPoint(x: cornerRadius, y: height - cornerRadius),
                       startAngle: .pi / 2,
                       endAngle: .pi,
                       foldedHypothenuse: (CGPoint(x: foldedCornerHeight, y: height), CGPoint(x: 0, y: height - foldedCornerHeight)),
                       foldedCornerCenter: CGPoint(x: foldedCornerHeight - cornerRadius, y: height - foldedCornerHeight + cornerRadius),
                       isFolded: foldedCornerMask.contains(.layerMinXMaxYCorner))
        )
        
        foldedCorners.append( // top left
            drawCorner(cornerCenter: CGPoint(x: cornerRadius, y: cornerRadius),
                       startAngle: .pi,
                       endAngle: 3 * .pi / 2,
                       foldedHypothenuse: (CGPoint(x: 0, y: foldedCornerHeight), CGPoint(x: foldedCornerHeight, y: 0)),
                       foldedCornerCenter: CGPoint(x: foldedCornerHeight - cornerRadius, y: foldedCornerHeight - cornerRadius),
                       isFolded: foldedCornerMask.contains(.layerMinXMinYCorner))
        )
        
        mainColor.setFill()
        path.fill()
        
        foldedCornerColor.setFill()
        
        foldedCorners.forEach {
            $0?.fill()
        }
    }
}
