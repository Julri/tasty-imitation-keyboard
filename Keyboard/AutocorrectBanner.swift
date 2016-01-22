//
//  AutocorrectBanner.swift
//  TastyImitationKeyboard
//
//  Created by Julien Levy on 22/01/2016.
//  Copyright © 2016 Apple. All rights reserved.
//


import UIKit


class AutocorrectBanner: ExtraView {
    var buttons: NSMutableArray = NSMutableArray()
    
    var suggestionBackgroundColor: UIColor? = UIColor.grayColor()
    var selectedSuggestionBackgroungColor: UIColor? = UIColor.lightGrayColor()
    var selectedTextColor: UIColor? = UIColor.blueColor()
    
    let space: CGFloat = 0.8
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layout banner subviews")
        
        self.backgroundColor = UIColor.clearColor()
        
        var count: Int = 0
        for subview in self.subviews {
            if subview is UIButton {
                count++
            }
        }
        if count == 0 {
            self.displaySuggestions([], originalString: "")
        }
        self.updateBannerColors()
    }
    
    func updateBannerColors() {
        suggestionBackgroundColor = self.globalColors?.specialKey(self.darkMode, solidColorMode: self.solidColorMode)
        
        self.setButtonColors()
    }
    func setButtonColors() {
        for subview in self.subviews {
            if subview is UIButton {
                let button = subview as! UIButton
                button.backgroundColor = suggestionBackgroundColor
                button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
            }
        }
    }

    func displaySuggestions(var suggestionList: [String], originalString: String) {
        suggestionList.insert(originalString, atIndex: 0)
        
        self.removeAllButtonsFromView()
        
        let width: CGFloat = ((self.frame.width - CGFloat(2) * space) / CGFloat(3))
        
        for (var index = 0; index < 3; index++) {
            let button: UIButton = UIButton()
            button.layer.borderWidth = 0.4
            button.layer.borderColor = UIColor.clearColor().CGColor
            button.frame = CGRectMake(CGFloat(index) * (width + space), 0, width, self.frame.height)
            
            if suggestionList.count > index {
                button.setTitle(suggestionList[index], forState: UIControlState.Normal)
            }
            
            self.addSubview(button)
        }
        
        self.setButtonColors()
    }
    
    func removeAllButtonsFromView() {
        for subview in self.subviews {
            if subview is UIButton {
                subview.removeFromSuperview()
            }
        }
    }

}
