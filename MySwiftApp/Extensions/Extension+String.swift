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
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    /// - returns: Is queue empty after removing the whitespaces
    var isNotBlank: Bool {
        return !isBlank
    }
    
    /// - returns: Is queue empty after removing the whitespaces
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespaces).count == 0
    }
    
    /// Validate email string
    ///
    /// - parameter email: A String that rappresent an email address
    ///
    /// - returns: A Boolean value indicating whether an email is valid.
    func isValidEmail() -> Bool {
        return NSPredicate(format:"SELF MATCHES[c] %@", "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
            "\\@" +
            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
            "(" +
            "\\." +
            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
            ")+").evaluate(with: self)
    }
    
    func toBirthDate(withFormat format:String = "dd/MM/yyyy") -> Date?{
        return toDate(withFormat: format)
    }
    
    func toDate(withFormat format:String = "dd/MM/yyyy") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
        return dateFormatter.date(from: self)
    }
    
    func isStrongPassword() -> Bool {
        let range = NSRange(location: 0, length: self.utf16.count)
        let regex = try! NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
        return regex.firstMatch(in: self, options: [], range: range) != nil
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
