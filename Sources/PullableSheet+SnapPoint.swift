//
//  PullableSheet+SnapPoint.swift
//  PullableSheet
//
//  Created by Tatsuya Tanaka on 20180724.
//  Copyright © 2018年 tattn. All rights reserved.
//

import Foundation

extension PullableSheet {
    public enum SnapPoint {
        case min
        case max
        case custom(y: CGFloat)
    }

    func nearestPoint(of pointY: CGFloat) -> CGFloat {
        var result: (y: CGFloat, distance: CGFloat) = (0, .greatestFiniteMagnitude)
        for snapPoint in snapPoints {
            let y: CGFloat
            switch snapPoint {
            case .min: y = defaultMinY
            case .max: y = defaultMaxY
            case .custom(let customY): y = customY
            }
            let distance = abs(y - pointY)
            if result.distance > distance {
                result = (y: y, distance: distance)
            }
        }
        return result.y
    }
}
