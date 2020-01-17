//
//  UITableView+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class UITableView_Custom_Tests: XCTestCase {
    private class CustomCell: UITableViewCell {}
    
    func testDequeuingReusableCell() {
        let tableView = UITableView()
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
        _ = tableView.dequeueReusableCell(ofType: CustomCell.self, for: IndexPath(row: 0, section: 0))
    }
}
