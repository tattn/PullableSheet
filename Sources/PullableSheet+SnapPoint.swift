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

        var y: CGFloat {
            switch self {
            case .min:
                if #available(iOS 11.0, *) {
                    return UIApplication.shared.keyWindow!.safeAreaInsets.top // FIXME
                } else {
                    return 0
                }
            case .max:
                return UIScreen.main.bounds.height - {
                    if #available(iOS 11.0, *) {
                        return UIApplication.shared.keyWindow!.safeAreaInsets.bottom // FIXME
                    } else {
                        return 0
                    }
                }()
            case .custom(let y):
                return y
            }
        }
    }

    func nearestPoint(of pointY: CGFloat) -> CGFloat {
        var result: (y: CGFloat, distance: CGFloat) = (0, .greatestFiniteMagnitude)
        for snapPoint in snapPoints {
            let y = snapPoint.y
            let distance = abs(y - pointY)
            if result.distance > distance {
                result = (y: y, distance: distance)
            }
        }
        return result.y
    }
}

extension PullableSheet.SnapPoint: Comparable {
    public static func == (lhs: PullableSheet.SnapPoint, rhs: PullableSheet.SnapPoint) -> Bool {
        switch (lhs, rhs) {
        case (.min, .min): return true
        case (.max, .max): return true
        case (.custom(let y1), .custom(let y2)): return y1 == y2
        default: return false
        }
    }

    public static func < (lhs: PullableSheet.SnapPoint, rhs: PullableSheet.SnapPoint) -> Bool {
        switch (lhs, rhs) {
        case (.min, _): return true
        case (.max, _): return false
        case (_, .min): return false
        case (_, .max): return true
        case (.custom(let y1), .custom(let y2)): return y1 < y2
        }
    }
}
