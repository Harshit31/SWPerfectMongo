import XCTest

import PerfectMongoDBTests

var tests = [XCTestCaseEntry]()
tests += PerfectMongoDBTests.allTests()
XCTMain(tests)
