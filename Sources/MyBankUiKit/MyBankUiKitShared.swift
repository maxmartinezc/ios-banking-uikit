//
//  Shared.swift
//  
//
//  Created by Max Martinez Cartagena on 13-11-22.
//

import UIKit.UIImage

public class MyBankUiKitShared {
    public static let shared = MyBankUiKitShared()
    
    private init(){}
    
    public func image(name: String) -> UIImage? {
        return MyBankUIKitIcon.shared.image(name: name)
    }
    
    public func defaultRegularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Mont-Regular", size: size)!
    }
    
    public func defaultBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Mont-Bold", size: size)!
    }
    
    public func defaultBlackFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Mont-Black", size: size)!
    }
}
