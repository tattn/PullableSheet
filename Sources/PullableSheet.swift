//
//  PullableSheet.swift
//  PullableSheet
//
//  Created by Tatsuya Tanaka on 20180723.
//  Copyright © 2018年 tattn. All rights reserved.
//

import UIKit

open class PullableSheet: UIViewController {

    open var snapPoints: [SnapPoint] = [.min, .max]

    private var barView = UIView(frame: .init(x: 0, y: 5, width: 50, height: 5))
    let defaultMinY: CGFloat = UIApplication.shared.statusBarFrame.height
    var defaultMaxY: CGFloat {
        return UIScreen.main.bounds.height - {
            if #available(iOS 11.0, *) {
                return view.safeAreaInsets.bottom
            } else {
                return 0
            }
            }()
    }
    private let contentViewController: UIViewController?

    public init(content: UIViewController) {
        contentViewController = content
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        contentViewController = nil
        super.init(coder: aDecoder)
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        close()
    }

    private func setupViews() {
        view.backgroundColor = .clear
        view.layer.cornerRadius = 5
        view.clipsToBounds = true

        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        view.addGestureRecognizer(gesture)

        barView.backgroundColor = .black
        barView.layer.cornerRadius = 3
        view.addSubview(barView)
        barView.center.x = view.center.x
        barView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]

        if let content = contentViewController {
            addContainerView(content)
            content.view.frame.origin.y = barView.frame.maxY + barView.frame.minY
            content.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }

        setupBluredView()
    }

    private func setupBluredView() {
        let blurEffect = UIBlurEffect(style: .light) // .dark
        let visualEffect = UIVisualEffectView(effect: blurEffect)
        let bluredView = UIVisualEffectView(effect: blurEffect)
        bluredView.contentView.addSubview(visualEffect)

        visualEffect.frame = UIScreen.main.bounds
        bluredView.frame = UIScreen.main.bounds

        view.insertSubview(bluredView, at: 0)
    }

    open func add(to viewController: UIViewController, view: UIView? = nil) {
        viewController.addContainerView(self, view: view)
        self.view.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
    }

    open func scroll(toY y: CGFloat, duration: Double = 0.6) {
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [.allowUserInteraction], animations: {
            self.view.frame.origin.y = y

        }, completion: nil)
    }

    open func close() {
        scroll(toY: defaultMaxY)
    }

    @objc private func panGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)
        let velocity = recognizer.velocity(in: view)
        let y = view.frame.minY

        if y + translation.y >= defaultMinY, y + translation.y <= defaultMaxY {
            view.frame.origin.y = min(max(y + translation.y, defaultMinY), defaultMaxY)
            recognizer.setTranslation(.zero, in: view)
        }

        if recognizer.state == .ended, !snapPoints.isEmpty {
            let targetY = nearestPoint(of: y)
            let distance = abs(y - targetY)
            let duration = max(min(distance / velocity.y, distance / (UIScreen.main.bounds.height / 3)), 0.3)

            scroll(toY: targetY, duration: Double(duration))
        }
    }
}
