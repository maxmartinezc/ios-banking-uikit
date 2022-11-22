//
//  UIView+Extension.swift
//  
//
//  Created by Max Martinez Cartagena on 22-11-22.
//
import UIKit.UIView

public extension UIView {
    func showLoading() {
        let myBankUIKitLoadingView = MyBankUIKitLoadingView(frame: frame)
        self.addSubview(myBankUIKitLoadingView)
    }

    func hideLoading() {
        if let myBankUIKitLoadingView = subviews.first(where: { $0 is MyBankUIKitLoadingView }) {
            myBankUIKitLoadingView.removeFromSuperview()
        }
    }
}
