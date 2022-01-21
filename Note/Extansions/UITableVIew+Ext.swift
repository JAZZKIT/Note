//
//  UITableVIew+Ext.swift
//  Note
//
//  Created by Denny on 21.01.2022.
//

import UIKit

extension UITableView {
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
}
