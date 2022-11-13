//
//  MyBankUserAvatar.swift
//  
//
//  Created by Max Martinez Cartagena on 12-11-22.
//

import UIKit.UIImage

struct MyBankUIKitIcon {
    static let shared = MyBankUIKitIcon()
    
    private init(){}
    
    func image(name: String) -> UIImage? {
        if let kitIcon = UIImage(named: name, in: Bundle.module, compatibleWith: nil) {
            return kitIcon
        } else if let systemIcon = UIImage(systemName: name) {
            return systemIcon
        }
        fatalError("Icon not found")
    }
}
