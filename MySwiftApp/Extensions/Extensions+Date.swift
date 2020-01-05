//
//  Extensions+Date.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 10/05/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation

extension Date{
    
    init(epoch: Int){
        self.init(timeIntervalSince1970: TimeInterval(epoch))
    }
   
    var dateComponents: DateComponents {
        get {
            return Calendar.current.dateComponents(in: TimeZone(identifier: "UTC") ?? .current, from: self)
        }
    }
    
    var year: Int {
        get {
            return dateComponents.year ?? 0
        }
    }
    
    var month: Int {
        return dateComponents.month ?? -1
    }
    
    var epoch: Int {
        get {
            return Int(timeIntervalSince1970)
        }
    }
    
    var asBirthday: String {
        get {
            let formatter = DateFormatter.init();
            formatter.dateFormat = "dd MMM, yyyy"
            return formatter.string(from: self)
        }
    }
    
    var asBirthdayTextField : String {
        get {
            let formatter = DateFormatter.init();
            formatter.dateFormat = "dd-MM-yyyy"
            return formatter.string(from: self)
        }
    }
    
    var asOrder: String {
        get {
            let formatter = DateFormatter.init();
            formatter.dateFormat = "dd MMM, yyyy hh:mm a"
            return formatter.string(from: self)
        }
    }
    
     /// - returns: number of days between self and to date, it is not inclusive today
    func daysDifference(to : Date, inclusive: Bool = false) -> Int {
        return ((Calendar.current.ordinality(of: .day, in: .era, for: to) ?? 0) - (Calendar.current.ordinality(of: .day, in: .era, for: self) ?? 0)) + (inclusive ? 1 : 0)
    }
}
