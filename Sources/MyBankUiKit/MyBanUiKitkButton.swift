//
//  MyBankUIKitButton.swift
//  
//
//  Created by Max Martinez Cartagena on 03-11-22.
//

import UIKit

public class MyBankUIKitButton: UIButton {
    
    public convenience init() {
        fatalError("Can't create object from MyBankTextField class")
    }
    
    public convenience init(text: String) {
        self.init(frame: .zero)
        titleLabel?.text = text
        titleLabel?.font = MyBankUiKitShared.shared.defaultRegularFontWithSize(size: 16)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height/2
      }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(Color.Button.titleNormal, for: .normal)
       
        
        contentEdgeInsets = UIEdgeInsets(
          top: 10,
          left: 20,
          bottom: 10,
          right: 20
        )

        backgroundColor      = Color.Button.background
        
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = Color.Button.titleNormal
    }
}

// MARK: MyBankButtonCircle
public class MyBankUiKitButtonCircle: UIButton {
    
    public convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        titleLabel?.font = font
        setTitle(text, for: .normal)
        setup()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.width * 0.5
    }
    
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = Color.Button.circle
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
            
        titleLabel?.textAlignment = .center
        setTitleColor(Color.Button.titleNormal, for: .normal)
    }
}
