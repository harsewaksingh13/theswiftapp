//
//  Extensions+UITableView.swift
//  MySwiftApp
//
//  Created by Harsewak Singh on 15/05/2019.
//  Copyright © 2019 Harsewak Singh. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
//    @discardableResult
//    func setUniversalDataSource<Row>(emptyDataText:String = "No data to display", dataSource: UITableViewUniversalDataSource<Row>?) -> Bool {
//        if dataSource?.rows().count == 0{
//            let emptyDataSource = UITableViewUniversalEmptyDataSource.shared
//            emptyDataSource.items.removeAll()
//            emptyDataSource.items.append(Section(rows: [emptyDataText]))
//            self.dataSource = emptyDataSource
//            self.bounces = false
//            self.reloadData()
//            return false
//        }else {
//            if(dataSource?.sections().count ?? 1 > 1) { //predefined header height for lower os version - probably before 11.0 , todo: place a check on basis of os version instead
//                self.estimatedSectionHeaderHeight = 20
//                self.rowHeight = UITableView.automaticDimension
//            }
//            self.bounces = true
//            self.dataSource = dataSource
//            self.reloadData()
//            return true
//        }
//    }
    
    
    func register(_ aClass: AnyClass){
        self.register(aClass,forCellReuseIdentifier: String(describing: aClass))
    }
    
    func dequeueReusableCell(_ aClass: AnyClass) -> UITableViewCell? {
        return self.dequeueReusableCell(withIdentifier: String(describing: aClass))
    }
}
