//
//  LeBonCoinTestTests.swift
//  LeBonCoinTestTests
//
//  Created by Bérangère La Touche on 20/01/2020.
//  Copyright © 2020 Bérangère La Touche. All rights reserved.
//

import XCTest
@testable import LeBonCoinTest

class LeBonCoinTestTests: XCTestCase {
    
    var sut: URLSession!

    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .default)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    /// Test if the call api to Le bon coin  API return a 200 code
    func testValidCallToApiGetsHTTPStatusCode200() {
        let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json")

        let promise = expectation(description: "Status code: 200")

        let dataTask = sut.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()

        wait(for: [promise], timeout: 5)
    }
    
    /// Test if the call to Le bon coin API is complete
    func testCallToApiCompletes() {
        let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json")
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?

        let dataTask = sut.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
            
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)

        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }

}
