//
//  UITableView+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

class CustomCell: UITableViewCell {}

final class UITableView_Custom_Tests: XCTestCase {
    func testDequeuingReusableCell() {
        let tableView = UITableView()
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
        _ = tableView.dequeueReusableCell(ofType: CustomCell.self, for: IndexPath(row: 0, section: 0))
    }
    
    func testRegisteringNibs() {
        let tableView = UITableView()
        tableView.registerNib(type: CustomCell.self)
        _ = tableView.dequeueReusableCell(ofType: CustomCell.self, for: IndexPath(row: 0, section: 0))
    }
}
