//
//  ListingTest.swift
//  ListingAppTests
//
//  Created by Naeem Paracha on 30/10/2021.
//

import XCTest
@testable import ListingApp

class ListingTest: XCTestCase, ListingViewModelDelegate {

    enum TestingError: Error {

        case downLoadFailed
    }

    var listFetchExp: XCTestExpectation?

    let model = ListingViewModel()

    override func setUpWithError() throws {

        model.delegate = self
        listFetchExp = expectation(description: "fetchLists")
        model.fetchLists()
        waitForExpectations(timeout: 60.0, handler: nil)
        if model.list?.isEmpty ?? true {
            throw TestingError.downLoadFailed
        }
    }

    func testPerformanceExample() throws {

        self.measure {
            listFetchExp = expectation(description: "fetchLists")
            model.fetchLists()
            waitForExpectations(timeout: 60.0, handler: nil)
        }
    }

    func testListFetch() {

        let model = ListingViewModel()
        model.delegate = self
        listFetchExp = expectation(description: "fetchLists")
        model.fetchLists()
        waitForExpectations(timeout: 60.0, handler: nil)
        guard let list = model.list else {
            XCTFail("list download failed")
            return
        }

        XCTAssertFalse(list.isEmpty, "No items inside list")
    }


    func didFetchList(isSuccessFull: Bool) {

        listFetchExp?.fulfill()
    }

}

