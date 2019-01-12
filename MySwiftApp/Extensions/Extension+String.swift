//
//  Extension+String.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 11/01/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation


extension String {
    
    
    /// - returns: Is queue empty after removing the whitespaces
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespaces).count == 0
    }
    
}
