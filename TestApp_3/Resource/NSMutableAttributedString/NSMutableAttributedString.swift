//
//  NSMutableAttributedString.swift
//  TestApp_3
//
//  Created by Max on 09.09.2024.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    func setTextColor(color: UIColor, toSubstring : String) {
        
        if let range = self.string.range(of: toSubstring) {
            let nsRange = NSRange(range, in: self.string)
            
            self.addAttributes([NSAttributedString.Key.foregroundColor: color], range: nsRange)
        }
    }
}
