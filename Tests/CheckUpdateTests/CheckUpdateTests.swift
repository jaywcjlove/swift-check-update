//
//  CheckUpdateTests.swift
//  CheckUpdate
//
//  Created by 王楚江 on 2025/2/5.
//

import XCTest
@testable import CheckUpdate

class CheckUpdateTests: XCTestCase {
    func testCheckVersion() async throws {
        let expectation = XCTestExpectation(description: "Check version completion handler called")
        
        CheckUpdate.checkVersion { isUpdateNeeded, appStoreVersion, currentVersion in
            // Check if the completion handler is called
            XCTAssertNil(appStoreVersion)
            XCTAssertNil(currentVersion)
            // Check if the update is needed
            XCTAssertEqual(isUpdateNeeded, false)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 5.0)
    }
    
    func testDayBarCheckVersion() async throws {
        let expectation = XCTestExpectation(description: "Check version completion handler called")
        CheckUpdate.checkVersion(bundleId: "com.wangchujiang.daybar") { isUpdateNeeded, appStoreVersion, currentVersion in
            // Check if the completion handler is called
            XCTAssertEqual(appStoreVersion, "1.0")
            XCTAssertEqual(currentVersion, "16.0")
            // Check if the update is needed
            XCTAssertEqual(isUpdateNeeded, false)
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 5.0)
    }
    
    func testCompareVersion() {
        XCTAssertTrue(CheckUpdate.compareVersion(currentVersion: "1.0.0", appStoreVersion: "1.0.1"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "1.0.1", appStoreVersion: "1.0.0"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "1.0.0", appStoreVersion: "1.0.0"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "1.0.0", appStoreVersion: "1.0"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "1.0", appStoreVersion: "1.0"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "2.0", appStoreVersion: "1.0"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "2", appStoreVersion: "1.0"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "2", appStoreVersion: "2"))
        XCTAssertTrue(CheckUpdate.compareVersion(currentVersion: "2", appStoreVersion: "3.0"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "16.1.23.pre", appStoreVersion: "3.0"))
        
        // Additional edge cases
        XCTAssertTrue(CheckUpdate.compareVersion(currentVersion: "1.0", appStoreVersion: "1.0.1"))
        XCTAssertTrue(CheckUpdate.compareVersion(currentVersion: "1.0.0", appStoreVersion: "1.0.0.1"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "1.0.0.1", appStoreVersion: "1.0.0"))
        XCTAssertTrue(CheckUpdate.compareVersion(currentVersion: "1.0.0", appStoreVersion: "1.0.0.0.1"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "1.0.0.0.1", appStoreVersion: "1.0.0.0"))
        XCTAssertTrue(CheckUpdate.compareVersion(currentVersion: "1.0.0.0", appStoreVersion: "1.0.0.0.1"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "1.0.0.0.0.1", appStoreVersion: "1.0.0.0.0"))
        XCTAssertTrue(CheckUpdate.compareVersion(currentVersion: "1.0.0.0.0", appStoreVersion: "1.0.0.0.0.1"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "1.0.0.0.0.0.1", appStoreVersion: "1.0.0.0.0.0"))
        XCTAssertTrue(CheckUpdate.compareVersion(currentVersion: "1.0.0.0.0.0", appStoreVersion: "1.0.0.0.0.0.1"))
        XCTAssertFalse(CheckUpdate.compareVersion(currentVersion: "1.0.0.0.0.0.0.1", appStoreVersion: "1.0.0.0.0.0.0"))
        XCTAssertTrue(CheckUpdate.compareVersion(currentVersion: "1.0.0.0.0.0.0", appStoreVersion: "1.0.0.0.0.0.0.1"))
    }
}
