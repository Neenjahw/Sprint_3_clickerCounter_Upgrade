//
//  Sprint_3_clickerCounter_UpgradeUITestsLaunchTests.swift
//  Sprint_3_clickerCounter_UpgradeUITests
//
//  Created by Pavel Popov on 30.11.2023.
//

import XCTest

final class Sprint_3_clickerCounter_UpgradeUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
