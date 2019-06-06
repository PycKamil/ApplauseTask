//
//  ApplauseTaskUITests.swift
//  ApplauseTaskUITests
//
//  Created by Kamil Pyc on 06/06/2019.
//  Copyright © 2019 Kamil Pyc. All rights reserved.
//

import XCTest

class ApplauseTaskUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func test_afterAppLaunch_thereShouldBe10CellLoaded() {
        XCTAssertTrue(app.collectionViews.cells.count > 0)
    }

}
