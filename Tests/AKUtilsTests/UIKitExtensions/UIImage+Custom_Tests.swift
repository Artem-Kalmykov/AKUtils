//
//  UIImage+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class UIImage_Custom_Tests: XCTestCase {
    func testImageWithColor() {
        let color = UIColor(red: 0.3, green: 0.4, blue: 0.5, alpha: 0.6)
        let image = UIImage.create(withColor: color)
        XCTAssert(abs(image.size.width - 1.0) <= .ulpOfOne)
        XCTAssert(abs(image.size.height - 1.0) <= .ulpOfOne)
        
        let point = CGPoint.zero
        let cgImage : CGImage = image.cgImage!
        guard let pixelData = CGDataProvider(data: (cgImage.dataProvider?.data)!)?.data else {
            XCTFail()
            return
        }
        let data = CFDataGetBytePtr(pixelData)!
        let x = Int(point.x)
        let y = Int(point.y)
        let index = Int(image.size.width) * y + x
        let numBytes = CFDataGetLength(pixelData)
        XCTAssert(numBytes == 32)
        
        let red = CGFloat(data[4 * index]) / 255.0
        let green = CGFloat(data[4 * index + 1]) / 255.0
        let blue = CGFloat(data[4 * index + 2]) / 255.0
        let alpha = CGFloat(data[4 * index + 3]) / 255.0
        
        // Some color conversion happens
        XCTAssert(abs(red - 0.30196078431372547) <= .ulpOfOne)
        XCTAssert(abs(green - 0.23921568627450981) <= .ulpOfOne)
        XCTAssert(abs(blue - 0.1803921568627451) <= .ulpOfOne)
        XCTAssert(abs(alpha - 0.6) <= .ulpOfOne)
    }
}
