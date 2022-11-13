//
//  MyBankLabel.swift
//
//
//  Created by Max Martinez Cartagena on 06-11-22.
//

import UIKit

public class MyBankUiKitLabel: UILabel {
    
    public convenience init() {
        self.init(frame: .zero)
        self.font = MyBankUiKitShared.shared.defaultRegularFontWithSize(size: 16)
        setup()
    }
    
    public convenience init(font: UIFont) {
        self.init(frame: .zero)
        self.font = font
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
