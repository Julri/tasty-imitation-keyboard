//
//  AutocorrectKeyboard.swift
//  TastyImitationKeyboard
//
//  Created by Julien Levy on 22/01/2016.
//  Copyright © 2016 Apple. All rights reserved.
//


import UIKit


class AutocorrectKeyboard: KeyboardViewController {
    
    override func createBanner() -> ExtraView? {
        let dscribeBanner = AutocorrectBanner(globalColors: self.dynamicType.globalColors, darkMode: false, solidColorMode: self.solidColorMode())
        return dscribeBanner
    }

}
