//
//  MyBankUiKitCard.swift
//  
//
//  Created by Max Martinez Cartagena on 11-11-22.
//

import UIKit

enum CardTypes: String {
    case masterCard = "MasterCard"
    case visa = "VisaCard"
    case debit = "DebitCard"
    case none = ""
}

public class MyBankUiKitBaseCard: UIView {
    
    var cardType: CardTypes {
        return CardTypes.none
    }
    
    private let imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private let cardLabel: MyBankUiKitLabel = {
        let lbl = MyBankUiKitLabel(font: MyBankUiKitShared.shared.defaultRegularFontWithSize(size: 20))
        return lbl
    }()
    
    private let holderLabel: MyBankUiKitLabel = {
        let lbl = MyBankUiKitLabel(font: MyBankUiKitShared.shared.defaultRegularFontWithSize(size: 9.88))
        return lbl
    }()
    
    private let expirationDateLabel: MyBankUiKitLabel = {
        let lbl = MyBankUiKitLabel(font: MyBankUiKitShared.shared.defaultRegularFontWithSize(size: 9.88))
        return lbl
    }()
    
    public convenience init(label: String, holder: String, expd: String) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: self.cardType.rawValue, in: Bundle.module, compatibleWith: nil)!
        
        cardLabel.text = label
        holderLabel.text = holder
        expirationDateLabel.text = expd
        
        addSubview(imageView)
        addSubview(cardLabel)
        addSubview(holderLabel)
        addSubview(expirationDateLabel)
        
        setup()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            cardLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 118),
            cardLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 30),
            holderLabel.topAnchor.constraint(equalTo: cardLabel.bottomAnchor, constant: 18),
            holderLabel.leadingAnchor.constraint(equalTo: cardLabel.leadingAnchor),
            expirationDateLabel.topAnchor.constraint(equalTo: holderLabel.topAnchor),
            expirationDateLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -100),
        ])
    }
}

public class MyBankUiKitCardMasterCard: MyBankUiKitBaseCard {
    override var cardType: CardTypes {
        return CardTypes.masterCard
    }
}

public class MyBankUiKitCardVisa: MyBankUiKitBaseCard {
    override var cardType: CardTypes {
        return CardTypes.visa
    }
}

public class MyBankUiKitCardDebit: MyBankUiKitBaseCard {
    override var cardType: CardTypes {
        return CardTypes.debit
    }
}
