//
//  Pie.swift
//  MyEmojiFlipGame
//
//  Created by Kevin Huang on 2020-09-13.
//  Copyright © 2020 Chengjie Huang. All rights reserved.
//

import SwiftUI

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false // rotation direction
    
    var animatableData: AnimatablePair <Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        // Preparations for drawing
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min (rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians))
        )
        
        // Draw the Shape
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        p.addLine(to: center)
        return p
    }
}

