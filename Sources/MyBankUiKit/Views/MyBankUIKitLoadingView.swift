//
//  LoadingView.swift
//  
//
//  Created by Max Martinez Cartagena on 21-11-22.
//

import UIKit

class MyBankUIKitLoadingView: UIView {

    let spinninCircleView: SpinninCircleView = {
        let scv = SpinninCircleView()
        scv.translatesAutoresizingMaskIntoConstraints = false
        return scv
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Color.LoadView.loadingBackground
        addSubview(spinninCircleView)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        NSLayoutConstraint.activate([
                        
            spinninCircleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spinninCircleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            spinninCircleView.widthAnchor.constraint(equalToConstant: Layout.Loading.spinninCircleViewWidthAnchor),
            spinninCircleView.heightAnchor.constraint(equalToConstant: Layout.Loading.spinninCircleViewHeightAnchor),
            
        ])
    }
}

class SpinninCircleView: UIView {
    let spinningCircle = CAShapeLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        animate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        frame = CGRect(x: Layout.Loading.spinningCircleFrameX, y: Layout.Loading.spinningCircleFrameY, width: Layout.Loading.spinningCircleFrameWidth, height: Layout.Loading.spinningCircleFrameHeight)
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        spinningCircle.path = circularPath.cgPath
        spinningCircle.fillColor = Color.LoadView.spinnerCircleFillColor
        spinningCircle.strokeColor = Color.LoadView.spinnerCircleStrokeColor
        spinningCircle.lineWidth = Layout.Loading.spinningCircleLineWidth
        spinningCircle.strokeEnd = Layout.Loading.spinningCircleStrokeEnd
        spinningCircle.lineCap = .round
        self.layer.addSublayer(spinningCircle)
    }
    
    func animate() {
        UIView.animate(withDuration: Layout.Loading.spinningCircleAnimationDuration, delay: Layout.Loading.spinningCircleAnimationDelay, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        }) { (completed) in
            UIView.animate(withDuration: Layout.Loading.spinningCircleAnimationDuration, delay: Layout.Loading.spinningCircleAnimationDelay, options: .curveLinear, animations: {
                self.transform = CGAffineTransform(rotationAngle: Layout.Loading.spinningCircleRotationAngle)
            }) { (completed) in
                self.animate()
            }
        }
    }
}
