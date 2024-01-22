//
//  Utils.swift
//  MyPasswords
//
//  Created by Miguel Mexicano Herrera on 21/01/24.
//

import UIKit
class Utils {
    static func copyClipboard(text: String) {
        UIPasteboard.general.string = text
    }
}
