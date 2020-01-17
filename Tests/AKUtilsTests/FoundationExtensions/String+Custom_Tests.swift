//
//  String+Custom_Tests.swift
//  AKUtilsTests
//
//  Created by Artem Kalmykov on 17.01.2020.
//  Copyright © 2020 Artem Kalmykov. All rights reserved.
//

import XCTest
@testable import AKUtils

final class String_Custom_Tests: XCTestCase {
    func testSearch() {
        XCTAssert("1234".corresponds(toSearchString: "12"))
        XCTAssert("1234".corresponds(toSearchString: "23"))
        XCTAssert("1234".corresponds(toSearchString: "34"))
        XCTAssert("1234".corresponds(toSearchString: "1234"))
        XCTAssert(!"1234".corresponds(toSearchString: "13"))
        XCTAssert("abc".corresponds(toSearchString: "Àbc"))
    }
    
    func testStaticEmpty() {
        XCTAssert(String.isEmpty(nil))
        XCTAssert(String.isEmpty(""))
        XCTAssert(!String.isEmpty("1"))
    }
    
    func testCustomEmpty() {
        XCTAssert("".isEmpty)
        XCTAssert(" ".isEmpty)
        XCTAssert("\n".isEmpty)
        XCTAssert("\r".isEmpty)
        XCTAssert("\t".isEmpty)
        XCTAssert("   \n\t\r  ".isEmpty)
        XCTAssert(!"1".isEmpty)
        XCTAssert(!" 0".isEmpty)
    }
    
    func testEmailValidation() {
        XCTAssert("email@example.com".isValidEmail)
        XCTAssert("firstname.lastname@example.com".isValidEmail)
        XCTAssert("email@subdomain.example.com".isValidEmail)
        XCTAssert("firstname+lastname@example.com".isValidEmail)
        XCTAssert("email@123.123.123.123".isValidEmail)
        XCTAssert("email@[123.123.123.123]".isValidEmail)
        XCTAssert("\"email\"@example.com".isValidEmail)
        XCTAssert("1234567890@example.com".isValidEmail)
        XCTAssert("email@example-one.com".isValidEmail)
        XCTAssert("_______@example.com".isValidEmail)
        XCTAssert("email@example.name".isValidEmail)
        XCTAssert("email@example.museum".isValidEmail)
        XCTAssert("email@example.co.jp".isValidEmail)
        XCTAssert("firstname-lastname@example.com".isValidEmail)
        
        XCTAssert(!"plainaddress".isValidEmail)
        XCTAssert(!"#@%^%#$@#$@#.com".isValidEmail)
        XCTAssert(!"@example.com".isValidEmail)
        XCTAssert(!"Joe Smith <email@example.com>".isValidEmail)
        XCTAssert(!"email.example.com".isValidEmail)
        XCTAssert(!"email@example@example.com".isValidEmail)
        XCTAssert(!".email@example.com".isValidEmail)
        XCTAssert(!"email.@example.com".isValidEmail)
        XCTAssert(!"email..email@example.com".isValidEmail)
        XCTAssert(!"あいうえお@example.com".isValidEmail)
        XCTAssert(!"email@example.com (Joe Smith)".isValidEmail)
        XCTAssert(!"email@example".isValidEmail)
        XCTAssert(!"email@-example.com".isValidEmail)
        XCTAssert(!"email@example..com".isValidEmail)
        XCTAssert(!"Abc..123@example.com".isValidEmail)
    }
    
    func testRemovingHTMLTags() {
        XCTAssert("123<+>456<a sdadsad>789</a>".removingHTMLTags == "123456789")
    }
    
    func testLocalizedStrings() {
        XCTAssert("123".localized == "123")
        XCTAssert("ABC".localized == "ABC")
        XCTAssert("abc".localized == "abc")
    }
}
