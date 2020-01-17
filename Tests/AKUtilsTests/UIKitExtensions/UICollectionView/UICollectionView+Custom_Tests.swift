//
//  UICollectionView+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class UICollectionView_Custom_Tests: XCTestCase {
    private class CustomCell: UICollectionViewCell {}
    
    func testDequeuingReusableCell() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseID)
        _ = collectionView.dequeueReusableCell(ofType: CustomCell.self, for: IndexPath(item: 0, section: 0))
    }
}
