//
//  NYTimesMostPopularArticlesTests.swift
//  NYTimesMostPopularArticlesTests
//
//  Created by Thangarajan K on 08/08/18.
//  Copyright © 2018 Thangarajan K. All rights reserved.
//

import XCTest

class NYTimesMostPopularArticlesTests: XCTestCase {
    var vController: ViewController? = nil
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vController = getViewController()
    }
    
    func testAPICall() {
        vController?.getArticleData()
        let expectation = self.expectation(description: "Scaling")

        LRServiceManager.shared.getNyArticles { (response, error) in
            expectation.fulfill()
            XCTAssertNotNil(response)
        }
        waitForExpectations(timeout: 60.0, handler: nil)
    }
    
    func getViewController() -> ViewController? {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyBoard.instantiateViewController(withIdentifier: "ViewController")
        return controller as? ViewController
    }
}
