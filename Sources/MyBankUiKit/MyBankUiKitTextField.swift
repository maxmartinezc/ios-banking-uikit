//
//  MyBankTextField.swift
//
//
//  Created by Max Martinez Cartagena on 06-11-22.
//

import UIKit

public class MyBankUiKitBaseTextField: UITextField {
    let bottomLayer = CALayer()
    
    public convenience init() {
        fatalError("Can't create object from MyBankTextField class")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        bottomLayer.frame = CGRect(x: 0, y: bounds.height, width: bounds.width, height: 1)
    }
    
    func setupUnderlinedTextField() {
        bottomLayer.backgroundColor = UIColor.black.withAlphaComponent(0.1).cgColor
        layer.addSublayer(bottomLayer)
    }
    
    public func setClearButton(with image: UIImage, mode: UITextField.ViewMode) {
          let clearButton = UIButton(type: .custom)
          clearButton.setImage(image, for: .normal)
          clearButton.contentMode = .scaleToFill
          clearButton.addTarget(self, action: #selector(self.clear(sender:)), for: .touchUpInside)
          self.addTarget(self, action: #selector(self.displayClearButtonIfNeeded), for: .valueChanged)
          self.rightView = clearButton
          self.rightViewMode = mode
          tintColor = UIColor.black
      }
      
      @objc
      private func displayClearButtonIfNeeded() {
          self.rightView?.isHidden = (self.text?.isEmpty) ?? true
      }
      
      @objc
      private func clear(sender: AnyObject) {
          self.text = ""
          sendActions(for: .editingChanged)
      }
}

//MARK - MyBankUiKitTextFieldRegular
public class MyBankUiKitTextFieldRegular: MyBankUiKitBaseTextField {
    public convenience init() {
        self.init(frame: .zero)
        self.font = MyBankUiKitShared.shared.defaultRegularFontWithSize(size: 16)
        setupUnderlinedTextField()
    }
}

//MARK: MyBankUiKitTextFieldLarge
public class MyBankUiKitTextFieldLarge: MyBankUiKitBaseTextField {
    public convenience init() {
        self.init(frame: .zero)
        self.font = MyBankUiKitShared.shared.defaultRegularFontWithSize(size: 36)
        setupUnderlinedTextField()
    }
}

//MARK: MyBankUiKitTextFieldRounded
public class MyBankUiKitTextFieldRounded: MyBankUiKitBaseTextField {
    public convenience init(font: UIFont) {
        self.init(frame: .zero)
        self.font = font
        
        layer.borderWidth = 1.0
        layer.borderColor = Color.TextField.Rounded.border
        backgroundColor = Color.TextField.Rounded.background
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
      }
}
