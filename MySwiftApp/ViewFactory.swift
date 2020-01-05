//
//  ViewFactory.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 05/01/2020.
//  Copyright © 2020 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit

protocol ViewFactory {
    var backgroundColor : UIColor { get }
}

class UIViewFactory: ViewFactory {
    
    static let shared = UIViewFactory()
    
    let backgroundColor = UIColor.white
    
    func label(text: String? = nil, alignment: NSTextAlignment = .left, color: UIColor = UIColor.black, fontSize : CGFloat = 14,fontWeight:UIFont.Weight = .regular) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.textAlignment = alignment
        label.font = UIFont.systemFont(ofSize: fontSize,weight: fontWeight)
        return label
    }
    
    func labelSecondary(text: String? = nil, alignment: NSTextAlignment = .left, color: UIColor = UIColor(r: 168, g: 168, b: 168),fontSize : CGFloat = 14,fontWeight:UIFont.Weight = .regular) -> UILabel {
        return label(text:text, alignment: alignment, color:color,fontSize: fontSize,fontWeight: fontWeight)
    }
    
    func button(text: String? = nil, backgroundColor: UIColor = UIColor(hexColor: Color.primaryButton)) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.borderColor = backgroundColor.cgColor
        button.addShadow()
        button.addBorder()
        return button
    }
    
    func buttonSecondary(text: String? = nil, backgroundColor: UIColor = UIColor(hexColor: Color.secondayButton)) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.borderColor = backgroundColor.cgColor
        button.addShadow()
        button.addBorder()
        return button
    }
    
    func buttonBorderedSecondary(text: String? = nil,textColor: UIColor = .darkGray,borderColor: UIColor? = .darkGray) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = .clear
        button.addBorder(radius: 10, borderWidth: 1, borderColor: .darkGray)
        return button
    }
    
    func textButton(text: String? = nil,titleColor: UIColor = UIColor(hexColor: Color.primaryButton)) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.backgroundColor = .clear
        button.layer.borderWidth = 0
        button.setTitleColor(titleColor, for: .normal)
        return button
    }
    
    
    func field(placeholder:String?,backgroundColor: UIColor = UIColor.white, bottomLineColor: UIColor = UIColor.white, textColor : UIColor? = .white, placeHolderColor : UIColor = .lightGray) -> UITextField {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.layer.backgroundColor = backgroundColor.cgColor
        textField.textColor = textColor
        textField.font = UIFont.systemFont(ofSize: 15)
        // placeholder Color
        textField.attributedPlaceholder = NSAttributedString(string: placeholder!,
                                                             attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
        textField.addBottomBorder(bottomLineColor: bottomLineColor)
        
        return textField
    }
    
}
