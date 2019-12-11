//
//  CoreTests.swift
//  BookStoreTests
//
//  Created by Andre Bortoli on 12/11/19.
//  Copyright © 2019 Andre Bortoli. All rights reserved.
//

import XCTest
import BookStore
//import man

class CoreTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        let manage = manage
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoreIsSaveTrue() {
        let id = "738193"
        let isFavorite = ManageCoreData().managerCoreData(id: id, isToSave: true)
        XCTAssert(isFavorite, "Should save isFavorite" )
    }
    
    func testResponseCoreDelete() {
        let id = "739193"
        let isFavorite = ManageCoreData().managerCoreData(id: id, isToSave: false)
        XCTAssertFalse(isFavorite, "Should mark false in  isFavorite" )
    }
    
    func testIfSaveID() {
        let id = "738193"
        _ = ManageCoreData().managerCoreData(id: id, isToSave: true)
        let isFavorite = ManageCoreData().checkIfIdIsFavorite(id: id)
        XCTAssert(isFavorite, "Should save isFavorite")
    }
    func testInvalidID() {
        let idSave = "738193"
        let idInvalid = "192929"
        _ = ManageCoreData().managerCoreData(id: idSave, isToSave: true)
        let isFavorite = ManageCoreData().checkIfIdIsFavorite(id: idInvalid)
        XCTAssertFalse(isFavorite, "Should save isFavorite")
    }
}
