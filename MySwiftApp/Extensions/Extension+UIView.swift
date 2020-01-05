//
//  Extension+UIView.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 07/05/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit



extension UIView {
    
    func addConstraintsWithFormat(_ format: String, views: UIView..., options: NSLayoutConstraint.FormatOptions = NSLayoutConstraint.FormatOptions()) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: nil, views: viewsDictionary))
    }
    func addConstraintsWithFormatArray(_ format: String, views: [UIView], options: NSLayoutConstraint.FormatOptions = NSLayoutConstraint.FormatOptions()) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: nil, views: viewsDictionary))
    }

    
    
    //add subview to saveArea
    func addSubView(views: UIView...){
        for view in views {
            self.addSubview(view)
        }
    }
    
    //add vertical stick to bottom only constraint to views in order
    func addConstraints(bottomSpacing :Int = 0, height : Int = 0,views: UIView...){
        for view in views{
            self.addConstraintsWithFormat("V:[v0(\(height))]-\(bottomSpacing)-|", views: view)
        }
    }
    

    func addShadow(radius:CGFloat = 5,color:UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25),opacity:Float = 0.7) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
    
    
    func addBorder(radius:CGFloat = 5,borderWidth: CGFloat = 0, borderColor: UIColor = .gray) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    
    /// add sub view to this view and apply constraints both horizontal and vertical and stick to top only with default height dynamic, left, right, top sparcing
    /// This methods best work with one view to added in container
    /// - Parameters:
    ///   - view: view to added to this view and apply constraint
    ///   - height: height for view
    ///   - leftSpacing: left spacing default is 8
    ///   - rightSpacing: right spacing default is 8
    ///   - topSpacing: top spacing default is 4
    func addTopViewWithConstraints(view:UIView, height: Int = 0,leftSpacing: Int = 8, rightSpacing: Int = 8, topSpacing: Int = 4){
        self.addSubview(view)
        self.addConstraintsWithFormat("H:|-\(leftSpacing)-[v0]-\(rightSpacing)-|", views: view)
        if height > 0{
            self.addConstraintsWithFormat("V:|-\(topSpacing)-[v0(\(height))]", views: view)
        } else {
            self.addConstraintsWithFormat("V:|-\(topSpacing)-[v0]", views: view)
        }
    }
    
    /// add sub view to this view and apply constraints both horizontal and vertical with default height dynamic, left, right, top and bottom Spacing
    /// This methods best work with one view to added in container
    /// - Parameters:
    ///   - view: view to added to this view and apply constraint
    ///   - height: height for view
    ///   - leftSpacing: left spacing default is 8
    ///   - rightSpacing: right spacing default is 8
    ///   - topSpacing: top spacing default is 4
    ///   - bottomSpacing: bottom spacing default is 4
    func addViewWithConstraints(view:UIView, height: Int = 0,leftSpacing: Int = 8, rightSpacing: Int = 8, topSpacing: Int = 4, bottomSpacing: Int = 4){
        self.addSubview(view)
        self.addConstraintsWithFormat("H:|-\(leftSpacing)-[v0]-\(rightSpacing)-|", views: view)
        if height > 0{
            self.addConstraintsWithFormat("V:|-\(topSpacing)-[v0(\(height))]-\(bottomSpacing)-|", views: view)
        } else {
            self.addConstraintsWithFormat("V:|-\(topSpacing)-[v0]-\(bottomSpacing)-|", views: view)
        }
    }
    
    // With Equal Spacing adding views in sequence - this method is improved version of
    func addVerticalVisualConstraint(spacing: Int = 0, views: [UIView])  {
        var string = "V:|"
        for view in views.enumerated() {
            string = string + "-\(spacing)-[v\(view.offset)]"
        }
        string = string + "-\(spacing)-|"
        self.addConstraintsWithFormatArray(string, views: views)
    }
    
    func addVerticalVisualConstraint(spacing: Int = 0,heights:[Int], views: [UIView])  {
        var string = "V:|"
        for view in views.enumerated() {
            let height = heights[view.offset]
            if height >= 0 {
                string = string + "-\(spacing)-[v\(view.offset)(\(height))]"
            }else {
                string = string + "-\(spacing)-[v\(view.offset)]"
            }
        }
        string = string + "-\(spacing)-|"
        self.addConstraintsWithFormatArray(string, views: views)
    }
    
    func addHorizontalVisualConstraint(spacing: Int = 0,widths:[Int], views: [UIView])  {
        var string = "H:|"
        for view in views.enumerated() {
            let width = widths[view.offset]
            if width >= 0 {
                string = string + "-\(spacing)-[v\(view.offset)(\(width))]"
            }else {
                string = string + "-\(spacing)-[v\(view.offset)]"
            }
        }
        string = string + "-\(spacing)-|"
        self.addConstraintsWithFormatArray(string, views: views)
    }
    
    func addHorizontalVisualConstraint(spacing: Int = 0, views: [UIView])  {
        var string = "H:|"
        for view in views.enumerated() {
            string = string + "-\(spacing)-[v\(view.offset)]"
        }
        string = string + "-\(spacing)-|"
        self.addConstraintsWithFormatArray(string, views: views)
    }
    
    func addHorizontalVisualConstraintOnEdges(spacing: Int = 0, views: [UIView])  {
        var string = "H:|-\(spacing)-"
        for view in views.enumerated() {
            string = string + "[v\(view.offset)]"
        }
        string = string + "-\(spacing)-|"
        self.addConstraintsWithFormatArray(string, views: views)
    }
    
    func addHorizontalVisualConstraintToLeft(spacing: Int = 0, views: [UIView])  {
        var string = "H:|"
        for view in views.enumerated() {
            string = string + "-\(spacing)-[v\(view.offset)]"
        }
        self.addConstraintsWithFormatArray(string, views: views)
    }
    
    /// add horizontal visual constraints with left and right spacing
    /// e.g : it does this for n number of views
    ///        self.addConstraintsWithFormat("H:|[v0]|", views: topContainer)
    ///        self.addConstraintsWithFormat("H:|[v0]|", views: line)
    ///        self.addConstraintsWithFormat("H:|[v0]|", views: medicationsContainer)
    /// - Parameters:
    ///   - spacing: left and right spacing
    ///   - views: views to add constraints
    func addHorizontalVisualConstraint(spacing: Int = 0,views: UIView...){
        for view in views{
            self.addConstraintsWithFormat("H:|-\(spacing)-[v0]-\(spacing)-|", views: view)
        }
    }
    
    /// add vertical visual contraints with top and bottom spacing
    /// e.g: it does this for n mumber of views
    ///        .addConstraintsWithFormat("V:|-8-[v0]-8-|", views: view1)
    ///        .addConstraintsWithFormat("V:|-8-[v0]-8-|", views: view2)
    ///
    /// - Parameters:
    ///   - spacing: top and bottom spacing
    ///   - views: views to add constriants
    func addVerticalVisualConstraint(spacing: Int = 0,views: UIView...){
        for view in views{
            self.addConstraintsWithFormat("V:|-\(spacing)-[v0]-\(spacing)-|", views: view)
        }
    }
    
    
    func asCard()  {
        self.backgroundColor = .white
        self.addShadow(radius: 5,color: .black,opacity: 0.1)
        self.layer.cornerRadius = 10
    }
    
    func removeCardShadow() {
        self.addShadow(radius: 0,color: .black,opacity: 0)
    }
    
    func removeSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
}
extension UITextField {
    func addBottomBorder(bottomLineColor : UIColor = .gray){
        self.borderStyle = .none
        self.layer.masksToBounds = false
        self.layer.shadowColor = bottomLineColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    var safeText: String {
        get {
            return text ?? ""
        }
    }
    
}

        

//MARK: UIImage extension

extension UIImage {
    
    convenience init(asset:ImageAsset) {
        self.init(named:asset.rawValue)!
    }
}


extension UIButton {
    
    func enable(enable:Bool,disabledColor: UIColor = UIColor.gray,enabledColor: UIColor?)  {
        self.isEnabled = enable
        self.backgroundColor =  self.isEnabled ? enabledColor : disabledColor
    }
    
    func addToBottomOf(view: UIView)  {
        view.addSubview(self)
        view.addConstraints(bottomSpacing:80,height:45,views: self)
        view.addHorizontalVisualConstraint(spacing:30,views: self)
    }
}
